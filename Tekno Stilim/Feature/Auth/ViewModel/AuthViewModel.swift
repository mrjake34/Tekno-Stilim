	//
	//  LoginViewModel.swift
	//  Tekno Stilim
	//
	//  Created by Alkan Ataş on 11.02.2024.
	//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol {
	var formIsValid: Bool {get}
}
@MainActor
final class AuthViewModel: ObservableObject {
	@Published var loginError: LoginError?
	@Published var user: FirebaseAuth.User?
	@Published var userModel: UserModel?
	@Published var errorMessage: String?
	@Published var registerError: RegisterError?
	@Published var authStatus: AuthStatus?
	
	init() {
		self.user = Auth.auth().currentUser
		self.authStatus = .initial
		Task {
			await fetchUser()
		}
	}
	
	@MainActor
	func login(loginModel: LoginModel?) async {
		self.authStatus = .loading
		guard let model = loginModel else {
			self.loginError = .requiredData
			self.authStatus = .failed
			return
		}
		
		guard let email = model.email else {
			self.loginError = .requiredEmail
			self.authStatus = .failed
			return
		}
		
		guard let password = model.password else {
			self.loginError = .requiredPassword
			self.authStatus = .failed
			return
		}
		
		do {
			let response = try await Auth.auth().signIn(withEmail: email, password: password)
			self.user = response.user
			await fetchUser()
			self.authStatus = .success
			return
		}catch {
			self.errorMessage = error.localizedDescription
			self.authStatus = .failed
			return
		}
	}
	@MainActor
	func register(registerModel: RegisterModel?) async {
		self.authStatus = .loading
		guard let model = registerModel else {
			self.registerError = .requiredData
			self.authStatus = .failed
			return
		}
		guard let fullName = model.fullName else {
			self.registerError = .requiredFullName
			self.authStatus = .failed
			return
		}
		guard let email = model.email else {
			self.registerError = .requiredEmail
			self.authStatus = .failed
			return
		}
		guard let password = model.password else {
			self.registerError = .requiredPassword
			self.authStatus = .failed
			return
		}
		if model.password != model.passwordAgain {
			self.registerError = .passwordNotMatch
			self.authStatus = .failed
			return
		}
		do {
			let response = try await Auth.auth().createUser(withEmail: email, password: password)
			self.user = response.user
			let user = UserModel(id: response.user.uid, fullName: fullName, email: email)
			let encodedUserModel = try Firestore.Encoder().encode(user)
			guard let uid = user.id else {
				self.registerError = .unknownError
				self.authStatus = .failed
				return
			}
			try await Firestore.firestore().collection("users").document(uid).setData(encodedUserModel)
			self.authStatus = .success
			self.userModel = user
			return
		}catch {
			self.errorMessage = error.localizedDescription
			self.authStatus = .failed
			return
		}
	}
	
	func fetchUser() async {
		guard let auth = Auth.auth().currentUser?.uid else { return }
		guard let snapshot = try? await Firestore.firestore().collection("users").document(auth).getDocument() else { return }
		guard let data = try? snapshot.data(as: UserModel.self) else {
			return
		}
		self.userModel = data
	}
	
	
	func logout() {
		do {
			try Auth.auth().signOut()
			self.user = nil
			self.userModel = nil
		} catch {
			self.errorMessage = error.localizedDescription
		}
	}
}

enum LoginError {
	case requiredData
	case requiredEmail
	case requiredPassword
	case userNotFound
	case wrongPassword
}

enum RegisterError {
	case requiredData
	case requiredFullName
	case requiredEmail
	case requiredPassword
	case passwordNotMatch
	case userAlreadyExist
	case wrongPassword
	case unknownError
}

enum AuthStatus {
	case initial
	case loading
	case success
	case failed
}
