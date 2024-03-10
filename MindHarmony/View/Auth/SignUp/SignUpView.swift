//
//  SignUpView.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 01/03/2024.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var userIsLoggedIn = false
    @StateObject var dataManager = DataManager()
    
    var body: some View {
        if userIsLoggedIn { 
            MainTabView()
                .environmentObject(dataManager)
        } else {
            content
        }
    }
    
    var content: some View {
        ZStack {
            SignInHeader(
                title: "Sign In",
                subTitle: "Hello!"
            )
            VStack
            {
                SignInHeader(
                    title: "Sign Up",
                    subTitle: "Create new account"
                )
                SignInBody {
                    VStack {
                        TextFielWithUnderLineStyle(
                            title: "Name",
                            placeHolder: "Enter Your Name",
                            textBinding: $name
                        )
                        
                        
                        TextFielWithUnderLineStyle(
                            title: "Email",
                            placeHolder: "Enter Your email",
                            textBinding: $email
                        )
                        
                        TextFielWithUnderLineStyle(
                            title: "Password",
                            placeHolder: "Enter Your password",
                            textBinding: $password
                        )
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 60)
                  
                NavigationLink(
                destination: MainTabView()) {
                    Button(action: {
                        Auth.auth().createUser(withEmail: email, password: password) { result, error in
                            if let error = error {
                                print(error.localizedDescription)
                            } else {
                                userIsLoggedIn = true
                            }
                        }
                        
                        print("Email \(email) password \(password)")
                        
                    }) {
                        Text("Sign Up")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width / 1.25)
                    .background(Color.indigo)
                    .cornerRadius(10)
                    .padding(.top, 40)
                    
                }
                    NavigationLink(destination: SingInView()) {
                        HStack {
                            Text("Already have account? ")
                                .foregroundColor(Color.gray)
                            + Text("Sign In")
                                .foregroundColor(.indigo)
                        }
                        .padding(.top, 40)
                            /*.onAppear {
                                Auth.auth().addStateDidChangeListener { auth, user in
                                    if user != nil {
                                        userIsLoggedIn.toggle()
                                    }
                                }
                            }*/
                        }
                }
            }
            
        }
    }
}

#Preview {
    SignUpView()
}
