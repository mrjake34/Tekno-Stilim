//
//  ProfileView.swift
//  Tekno Stilim
//
//  Created by Alkan Ataş on 14.02.2024.
//

import SwiftUI

struct ProfileView: View {
	@EnvironmentObject var authViewModel: AuthViewModel
	var body: some View {
		Group {
			if let user = authViewModel.userModel {
				ProfileBody(user: user)
			}else {
				LoginView()
			}
		}
	}
}

struct ProfileBody: View {
	var user: UserModel
	var body: some View {
		VStack {
			List {
				HStack {
					Text(user.initials)
						.font(.title)
						.padding(.all)
						.foregroundColor(.white)
						.background(Color(.gray))
						.clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
					VStack(alignment: .leading) {
						Text(user.fullName ?? "")
							.font(.title2)
						Text(user.email ?? "")
							.font(.subheadline)
							.foregroundColor(.gray)
					}
				}
				Section(LocalizedStringKey("account")) {
					Button(action: {}, label: {
						HStack {
							Image(systemName: "list.clipboard")
							Text(LocalizedStringKey("wyOrders"))
						}
					})
					Button(action: {}, label: {
						HStack {
							Image(systemName: "creditcard")
							Text(LocalizedStringKey("myCards"))
						}
					})
					Button(action: {}, label: {
						HStack {
							Image(systemName: "building")
							Text(LocalizedStringKey("myAddress"))
						}
					})
					Button(action: {}, label: {
						HStack {
							Image(systemName: "doc")
							Text(LocalizedStringKey("userAgreement"))
						}
					})
					
				}
				Section(LocalizedStringKey("setting")) {
					ThemeChangerView()
					ChangeLangView()
				}
				LogoutButtonView()
				Section {
					Button(action: {}, label: {
						HStack {
							Image(systemName: "icloud.and.arrow.down")
							Text(LocalizedStringKey("downloadData"))
						}
					})
					Button(action: {}, label: {
						HStack {
							Image(systemName: "trash")
								.foregroundColor(.red)
							Text(LocalizedStringKey("deleteAccount"))
								.foregroundColor(.red)
						}
					})
				}
			}
		}
	}
}

struct LogoutButtonView: View {
	@EnvironmentObject var authViewModel: AuthViewModel
	var body: some View {
		Section {
			Button(action: {
				authViewModel.logout()
			}, label: {
				HStack {
					Image(systemName: "rectangle.portrait.and.arrow.right")
					Text("logout")
				}
			})
		}
	}
}


#Preview {
	ProfileView()
		.environmentObject(AuthViewModel())
}

