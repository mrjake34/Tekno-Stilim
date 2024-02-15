	//
	//  RegisterView.swift
	//  Tekno Stilim
	//
	//  Created by Alkan Ataş on 12.02.2024.
	//

import SwiftUI

struct RegisterView: View {
	var body: some View {
		VStack(alignment: .center, content: {
			HeadTitle()
			RegisterForm()
		})
		.navigationTitle("Register")
		.navigationBarTitleDisplayMode(.inline)
		.padding(.all)
	}
}

#Preview {
	RegisterView()
}


struct HeadTitle: View {
	var body: some View {
		HStack {
			VStack(alignment: .leading,content: {
				Text("Create")
				Text("Account")
			})
			.font(.largeTitle)
			.fontWeight(.semibold)
			.padding(.top, 10.0)
			Spacer()
		}
	}
}

struct RegisterForm: View {
	@State private var fullName = ""
	@State private var email = ""
	@State private var password = ""
	@State private var passwordAgain = ""
	@EnvironmentObject var viewModel: AuthViewModel
	@StateObject private var viewModel: AuthViewModel = AuthViewModel()
	var body: some View {
		VStack {
			Spacer()
			VStack(alignment: .leading){
				InputTextView(title: "Name", label: "Please Enter Your Name", text: $fullName)
				InputTextView(title: "Email", label: "Please Enter Your Email", text: $email)
				SecureInputTextView(title: "Password", label: "Please Enter Your Password", text: $password)
				SecureInputTextView(title: "Confirm Password", label: "Please Enter Your Confirm Password", text: $passwordAgain)
			}
			.padding(.all)
			Button(action: {
				Task {
					await viewModel.register(registerModel: RegisterModel(fullName: fullName, email: email, password: password, passwordAgain: passwordAgain))
				}
			}, label: {
				Text("Register")
			})
			if let message = viewModel.errorMessage {
				Text(message)
			}
			Spacer()
			Spacer()
			NavigationLink("Do you have an account?") {
				LoginView()
			}
			Spacer()
		}
		
	}
}
