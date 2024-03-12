//
//  MainTabView.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 02/03/2024.

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var dataManager : DataManager
    @StateObject var homeKitStorage = HomeKitStorage()
    
    var body: some View {
        TabView {
            HomeView(viewModel: MeditationViewModel())
                .environmentObject(dataManager)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            FavoriteListView(favoritesViewModel: FavoritesViewModel())
                .environmentObject(dataManager)
                .tabItem {
                    Image(systemName: "suit.heart")
                    Text("Favorite")
                }
            HomesListPage(model: HomesListPageModel(HomeKitStorage())).environmentObject(homeKitStorage) 
                .tabItem {
                    Image(systemName: "tv.and.mediabox.fill")
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
