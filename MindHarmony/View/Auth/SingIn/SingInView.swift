//
//  SingInView.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 01/03/2024.
//

import SwiftUI
import FirebaseAuth

struct SingInView: View {
    
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
            Text("Hello again, Welcome back!")
                .foregroundColor(Color.gray)
                .fontWeight(.bold)
            SignInBody {
                VStack {
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
                            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                                if let error = error {
                                    print(error.localizedDescription)
                                }
                                else {
                                    userIsLoggedIn = true
                                }
                            }
                            print("Email \(email) password \(password)")
                        }) {
                            Text("Sign in")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                        .padding()
                        .frame(width: UIScreen.main.bounds.width / 1.25)
                        .background(Color.indigo)
                        .cornerRadius(10)
                        .padding(.top, 40)
                    }
                NavigationLink(destination: SignUpView()) {
                    HStack {
                        Text("Don't Have account? ")
                            .foregroundColor(Color.gray)
                        + Text("Sign Up")
                            .foregroundColor(.indigo)
                    }
                    .padding(.top, 40)

                }
            }
        }
        .navigationBarHidden(true)
        .padding()
    }
}


struct TextFielWithUnderLineStyle: View {
    var title: String
    var placeHolder: String
    var textBinding: Binding<String> = .constant("")
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            TextField(placeHolder, text: textBinding)
            Divider()
        }
        .padding(.top, 20)
    }
}

struct SignInBody<Content: View>: View {
    let content: Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                content
            }
        }
        .frame(height: UIScreen.main.bounds.height / 1.7)
        .background(Color.white)
        .cornerRadius(3.0)
    }
}

#Preview {
    SingInView()
}


struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect, byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
