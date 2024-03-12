//
//  ContentView.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 09/02/2024.
//
 
import SwiftUI

struct ContentView: View {
    //@StateObject var dataManager = DataManager()
    
    @EnvironmentObject var dataManager : DataManager
    @State var iPhoneConnector = iPhoneCommunicationManager()
    
    
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack {
                        Image("")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            //.offset(x: 10 , y: -10)
                    }
                    .padding()
                    Spacer()
                    
                    HStack {
                        Text("Welcome\nto\nMindHarmony")
                            .foregroundColor(Color.gray)
                            .fontWeight(.bold)
                            //.offset(x: 10, y:-70)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 40)
                    HStack {
                        Spacer()
                        NavigationLink(
                            destination: /*MainTabView())*/SingInView().environmentObject(dataManager)) {
                                RoundedView(
                                    boarderColor: .gray,
                                    title: "Sign in",
                                    titleForegroundColor: .indigo,
                                    backgroundColor: .white,
                                    action: {
                                        // TO DO: - navigation to sign in screen
                                    })
                                .offset(x: -100)
                                .onAppear() {
                                    iPhoneConnector.test()
                                }
                            }
                    }
                    .padding(.vertical)
                    HStack {
                        Spacer()
                        NavigationLink(
                            destination: SignUpView().environmentObject(dataManager)) {
                                RoundedView(
                                    boarderColor: .clear,
                                    title: "Sign up",
                                    titleForegroundColor: .white,
                                    backgroundColor: .indigo,
                                    action:{
                                        //TO DO - navigation to signn up screen
                                    })
                                    .offset(x: -100)
                            }
                    }
                }
            }
            .navigationBarHidden(true)
            .environmentObject(dataManager)
        }

    }
}

       
#Preview {
    ContentView()
}
