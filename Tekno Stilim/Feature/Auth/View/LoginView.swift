//
//  LoginView.swift
//  Tekno Stilim
//
//  Created by Alkan Ataş on 28.01.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
	@EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
		NavigationView(
			content: {
			VStack(alignment: .center, content: {
				Spacer()
				ZStack {
					Image("logo")
						.resizable()
						.aspectRatio(contentMode: .fill)
						.frame(width: 150, height: 150)
					Circle()
						.stroke(.white,lineWidth: 4)
						.shadow(radius: 4)
						.frame(width: 180, height: 180)
				}
				VStack(content: {
					TextField("Email", text: $email)
						.padding(.all, 10.0)
						
					SecureField("Password", text: $password)
						.padding(.all, 10.0)
					Button {
						Task {
							await authViewModel.login(loginModel: LoginModel(email: email, password: password))
						}
					} label: {
						Text("Login")
					}
				}).padding(20)
				Spacer()
				NavigationLink("Do you have not an account?") {
					RegisterView()
				}
				Spacer()
			})
			.padding(.all)
				
		}).navigationBarBackButtonHidden(true)
    }
}


#Preview {
	LoginView()
}


