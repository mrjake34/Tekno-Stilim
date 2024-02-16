//
//  TabBarView.swift
//  Tekno Stilim
//
//  Created by Alkan Ataş on 11.02.2024.
//

import SwiftUI

struct TabBarView: View {
	var body: some View {
		NavigationView {
			TabBar()
		}
	}
}

#Preview {
	TabBarView()
}

struct TabBar: View {
	@State private var pageIndex: Int = 0
	@StateObject var authViewModel: AuthViewModel = AuthViewModel()
	@StateObject var changeLanguageViewModel: ChangeLangViewModel = ChangeLangViewModel()
	var body: some View {
		TabView(selection: $pageIndex,
				content:  {
			HomeView().tabItem {
				ZStack {
					Image(systemName: "house")
					Text(LocalizedStringKey("home"))
				}
				
			}
			.onAppear {
				pageIndex = 1
			}
			.tag(1)
			ProductList().tabItem {
				VStack {
					Image(systemName: "shippingbox")
					Text(LocalizedStringKey("products"))
				}}
			.onAppear {
				pageIndex = 2
			}
			.tag(2)
			Text("cart").tabItem {
				VStack {
					Image(systemName: "cart")
					Text(LocalizedStringKey("cart"))
				}
			}
			.onAppear {
				pageIndex = 3
			}
			.tag(3)
			Group {
				ProfileView()
					.tabItem {
						VStack {
							Image(systemName: "person")
							Text(LocalizedStringKey("profile"))
						}
					}
					.onAppear {
						pageIndex = 4
					}
					.tag(4)
			}
		})
		.environmentObject(authViewModel)
		.environmentObject(changeLanguageViewModel)
		.environment(\.locale, .init(identifier: changeLanguageViewModel.currentLanguage?.identifier ?? ""))
		
		
	}
    @State private var pageIndex: Int = 0
    
    var body: some View {
        NavigationView {
            TabView(selection: $pageIndex,
                    content:  {
                HomeView().tabItem {
                    ZStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    
                }
                .onAppear {
                    pageIndex = 1
                }
                .tag(1)
                ProductList().tabItem {
                    VStack {
                        Image(systemName: "shippingbox")
                        Text("Products")
                    }}
                .onAppear {
                    pageIndex = 2
                }
                .tag(2)
                Text("Cart").tabItem {
                    VStack {
                        Image(systemName: "cart")
                        Text("Cart")
                    }
                }
                .onAppear {
                    pageIndex = 3
                }
                .tag(3)
                LoginView().tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                }
                .onAppear {
                    pageIndex = 4
                }
                .tag(4)
            })
        }
    }
}

#Preview {
    TabBarView()
}
