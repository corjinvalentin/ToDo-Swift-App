//
//  LoginView.swift
//  ToDo
//
//  Created by Corjin Valentin on 16.02.2022.
//

import SwiftUI

struct LoginView: View {
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Color5")
                    .ignoresSafeArea()
                
                VStack(alignment: .center, spacing: 22) {
                    HStack {
                        Text("Login")
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer(minLength: 0)
                    }
                    .padding(.top, 40)
                    
                    HStack {
                        Image(systemName: "person.fill").resizable().frame(width: 20, height: 20)
                        TextField("E-mail", text: $email).padding(.leading, 12).font(.system(size: 20))
                    }
                    .padding(12)
                    .background(Color("Color6").opacity(0.9))
                    .cornerRadius(20)
                    
                    Divider().background(Color.white.opacity(0.5))
                    
                    HStack {
                        Image(systemName: "lock.fill").resizable().frame(width: 15, height: 20).padding(.leading, 3)
                        SecureField("Password", text: $password).padding(.leading, 12).font(.system(size: 20))
                    }
                    .padding(12)
                    .background(Color("Color6").opacity(0.9))
                    .cornerRadius(20)
                    
                    HStack {
                        Spacer(minLength: 0)
                        
                        Button (action: {
                            
                        }, label: {
                            Text("Forget Password?")
                                .foregroundColor(Color.white.opacity(0.6))
                        })
                    }
                    .padding(.horizontal)
                    .padding(.top, 30)
                    
                    HStack {
                        Spacer(minLength: 0)
                        
                        NavigationLink(destination: RegisterView(email: $email, password: $password, confirmPassword: $password)
                        , label: {
                            Text("New to app? Sign up!")
                                .foregroundColor(Color.white.opacity(0.6))
                        })
                    }
                    .padding(.horizontal)
                }
                .padding()
                .padding(.bottom, 65)
                .background(Color("Color4").opacity(0.1))
                .clipShape(CShape())
                .cornerRadius(35)
                .padding(.horizontal, 20)
            }
        }
    }
}

