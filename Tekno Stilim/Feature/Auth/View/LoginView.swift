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
				Image("logo")
					.resizable()
					.frame(width: 150, height: 150)
					.aspectRatio(contentMode: .fill)
					.clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
				VStack(content: {
					TextField(LocalizedStringKey("email"), text: $email)
						.padding(.all, 10.0)
						
					SecureField(LocalizedStringKey("password"), text: $password)
						.padding(.all, 10.0)
					Button {
						Task {
							await authViewModel.login(loginModel: LoginModel(email: email, password: password))
						}
					} label: {
						Text(LocalizedStringKey("login"))
					}
				}).padding(20)
				Spacer()
				NavigationLink(LocalizedStringKey("doYouHaveNotAnAccount")) {
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


