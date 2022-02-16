//
//  ContentView.swift
//  ToDo
//
//  Created by Corjin Valentin on 16.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State var index = false
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Color5")
                    .ignoresSafeArea()
                
                VStack {
                    Text("Welcome to my app")
                        .bold()
                        .offset(y: -100)
                        .font(.system(size: 30))
                    
                    LoginView(email: $email, password: $password)
                        .offset(y: -50)
                    //RegisterView(email: $email, password: $password, confirmPassword: $password)
                    //    .offset(y: -50)
                    
                    
                    NavigationLink(destination: HomeView(),
                                   label: {
                        Text("Login")
                            .bold()
                            .frame(width: 200, height: 50)
                            .background(Color("Color6"))
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    })
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
