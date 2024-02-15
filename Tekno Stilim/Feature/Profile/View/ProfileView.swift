//
//  ProfileView.swift
//  Tekno Stilim
//
//  Created by Alkan Ataş on 14.02.2024.
//

import SwiftUI

struct ProfileView: View {
	@EnvironmentObject private var authViewModel: AuthViewModel
	var body: some View {
		Group {
			if authViewModel.userModel != nil {
				ProfileBody(
					user: authViewModel.userModel!
				)
			}else {
				LoginView()
			}
		}
	}
}

#Preview {
    ProfileView()
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
				Section("Account") {
					Button(action: {}, label: {
						HStack {
							Image(systemName: "list.clipboard")
							Text("My Orders")
						}
					})
					Button(action: {}, label: {
						HStack {
							Image(systemName: "creditcard")
							Text("My Cards")
						}
					})
					Button(action: {}, label: {
						HStack {
							Image(systemName: "building")
							Text("My Address")
						}
					})
					Button(action: {}, label: {
						HStack {
							Image(systemName: "doc")
							Text("User Agreement")
						}
					})
					
				}
				Section("Setting") {
					ThemeChangerView()
				}
				LogoutButtonView()
				Section {
					Button(action: {}, label: {
						HStack {
							Image(systemName: "icloud.and.arrow.down")
							Text("Download Data")
						}
					})
					Button(action: {}, label: {
						HStack {
							Image(systemName: "trash")
								.foregroundColor(.red)
							Text("Delete Account")
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
					Text("Logout")
				}
			})
		}
	}
}


