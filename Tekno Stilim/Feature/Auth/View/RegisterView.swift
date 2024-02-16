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
		.navigationTitle(LocalizedStringKey("register"))
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
				Text(LocalizedStringKey("create"))
				Text(LocalizedStringKey("account"))
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
	var body: some View {
		VStack {
			Spacer()
			VStack(alignment: .leading){
				InputTextView(title: "name", label: "enterYourName", text: $fullName)
				InputTextView(title: "email", label: "enterYourEmail", text: $email)
				SecureInputTextView(title: "password", label: "enterYourPassword", text: $password)
				SecureInputTextView(title: "confirmPassword", label: "enterYourPassword", text: $passwordAgain)
			}
			.padding(.all)
			Button(action: {
				Task {
					await viewModel.register(registerModel: RegisterModel(fullName: fullName, email: email, password: password, passwordAgain: passwordAgain))
				}
			}, label: {
				Text(LocalizedStringKey("register"))
			})
			Spacer()
			NavigationLink(LocalizedStringKey("doYouHaveAnAccount")) {
				LoginView()
			}
			Spacer()
		}
		
	}
}
