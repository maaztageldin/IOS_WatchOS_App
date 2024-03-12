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
    @State private var selectedHome: UUID?
    @State private var showAccessoryDiscoveryView = false
    @ObservedObject private var accessoryManager = AccessoryManager()

    var body: some View {
        VStack {
            NavigationLink(destination: AccessoryDiscoveryView(accessoryManager: accessoryManager, selectedHome: $selectedHome, homeKitStorage: homeKitStorage), isActive: $showAccessoryDiscoveryView) {
                EmptyView()
            }
            Button(action: {
                showAccessoryDiscoveryView = true
            }) {
                Text("Find accessories")
            }
        }
        .navigationBarTitle("Home Page")
    }
}



/*
struct HomePageViewContainer : View {
    var homeId: UUID
    
    @EnvironmentObject private var homeKitStorage: HomeKitStorage
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack {
            NavigationLink(destination: AccessoryDiscoveryView()) {
                Text("Find accessories")
            }
        }
           /* Text(" .... ")
            
            Button(action: {
                self.addHome()
            }) {
                Text("Add Home")
            }
        }
        .navigationBarTitle("Home Page")*/
    }
    
    func addHome() {
        homeKitStorage.addHome()
        self.presentationMode.wrappedValue.dismiss() 
    }
}*/



