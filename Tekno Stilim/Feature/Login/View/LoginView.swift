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
    
    
    var body: some View {
        
        loginView()
    }
    
    fileprivate func loginView() -> some View {
        NavigationView(content: {
            VStack(alignment: .center, content: {
                Spacer()
                ZStack {
                    Image("logo").resizable().aspectRatio(contentMode: .fill).frame(width: 150, height: 150)
                    Circle().stroke(.white,lineWidth: 4).shadow(radius: 4).frame(width: 180, height: 180)
                }
                VStack(content: {
                    TextField("E-Mail", text: $email)
                        .padding(.all, 10.0)
                    SecureField("Password", text: $password)
                        .padding(.all, 10.0)
                    NavigationLink("Login") {
                        HomeView(
                            
                        )
                    }
                }).padding(20)
                Spacer()
                
            })
            .padding(.all)
        }).navigationBarBackButtonHidden(true)
        
    }
}


