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
    @EnvironmentObject var dataManager : DataManager

    var body: some View {
        if userIsLoggedIn {
            MainTabView()
                .environmentObject(dataManager)
        } else {
            content
        }
    }

    var content: some View {
            VStack {
                Text("Register")
                    .foregroundColor(Color.gray)
                    .fontWeight(.bold)
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
                }
                NavigationLink(destination: MainTabView()) {
                    Button(action: {
                        Auth.auth().createUser(withEmail: email, password: password) { result, error in
                            if let error = error {
                                print(error.localizedDescription)
                            } else if let user = result?.user {
                             
                                let newUser = User(id: user.uid, email: email, name: name, dateOfBirth: Date(), photo: "", favorites: [])
                                
                              
                                let db = Firestore.firestore()
                                db.collection("User").document(user.uid).setData(newUser.dictionary) { error in
                                    if let error = error {
                                        print("Error adding user to Firestore: \(error.localizedDescription)")
                                    } else {
                 
                                        userIsLoggedIn = true
                                    }
                                }
                            }
                        }
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
                }
            }
        //}
    }
}

#Preview {
    SignUpView()
}
