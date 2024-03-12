//
//  HomePage.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 11/03/2024.
//

import HomeKit
import SwiftUI

struct HomePageViewContainer : View {
    var homeId: UUID
    
    @EnvironmentObject private var homeKitStorage: HomeKitStorage
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Your home content goes here...")
            
            Button(action: {
                self.addHome()
            }) {
                Text("Add Home")
            }
        }
        .navigationBarTitle("Home Page")
    }
    
    func addHome() {
        homeKitStorage.addHome()
        self.presentationMode.wrappedValue.dismiss() 
    }
}


