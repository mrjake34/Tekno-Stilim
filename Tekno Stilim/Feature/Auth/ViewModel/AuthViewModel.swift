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
	@Published var errorMessage: String?
	@Published var registerError: RegisterError?
	@MainActor
	func login(loginModel: LoginModel?) async {
		guard let model = loginModel else {
			self.loginError = .requiredData
			return
		}
		
		guard let email = model.email else {
			self.loginError = .requiredEmail
			return
		}
		
		guard let password = model.password else {
			self.loginError = .requiredPassword
			return
		}
		
		do {
			let response = try await Auth.auth().signIn(withEmail: email, password: password)
			self.user = response.user
		}catch {
			self.errorMessage = error.localizedDescription
		}
    }
	@MainActor
	func register(registerModel: RegisterModel?) async {
		guard let model = registerModel else {
			self.registerError = .requiredData
			return
		}
		guard let fullName = model.fullName else {
			self.registerError = .requiredFullName
			return
		}
		guard let email = model.email else {
			self.registerError = .requiredEmail
			return
		}
		guard let password = model.password else {
			self.registerError = .requiredPassword
			return
		}
		if model.password != model.passwordAgain {
			self.registerError = .passwordNotMatch
			return
		}
		do {
			let response = try await Auth.auth().createUser(withEmail: email, password: password)
			self.user = response.user
			let user = UserModel(id: response.user.uid, fullName: fullName, email: email)
			let encodedUserModel = try Firestore.Encoder().encode(user)
			guard let uid = user.id else {
				self.registerError = .unknownError
				return
			}
			try await Firestore.firestore().collection("users").document(uid).setData(encodedUserModel)
		}catch {
			self.errorMessage = error.localizedDescription
			return
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
