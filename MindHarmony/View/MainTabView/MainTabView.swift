//
//  MainTabView.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 02/03/2024.

import SwiftUI

struct MainTabView: View {
    @StateObject var dataManager = DataManager()
    
    var body: some View {
        TabView {
            HomeView(viewModel: MeditationViewModel())
                .environmentObject(dataManager)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Text("Another Tab")
                .tabItem {
                    Image(systemName: "suit.heart")
                    Text("Favorite")
                }
            DeviceControlView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Devices")
                }
            
        }
        .font(.headline)
        .accentColor(.indigo)
    }
}

#Preview {
    MainTabView()
}
