//
//  LoginViewModel.swift
//  Tekno Stilim
//
//  Created by Alkan Ataş on 11.02.2024.
//

import Foundation
import FirebaseAuth

protocol AuthenticationFormProtocol {
	var formIsValid: Bool {get}
}

final class AuthViewModel: ObservableObject {
    @Published var loginError: LoginError?
	@Published var userSession: FirebaseAuth.User?
	@Published var errorMessage: String?
    
	func login(loginModel: LoginModel?) async {
		guard let model = loginModel else {
			self.loginError = LoginError.requiredData
			return
		}
		
		guard let email = model.email else {
			self.loginError = LoginError.requiredEmail
			return
		}
		
		guard let password = model.password else {
			self.loginError = LoginError.requiredPassword
			return
		}
		
		do {
			let response = try await Auth.auth().signIn(withEmail: email, password: password)
			self.userSession = response.user
		}catch {
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

