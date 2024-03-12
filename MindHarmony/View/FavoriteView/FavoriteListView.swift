//
//  FavoriteListView.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 10/03/2024.
//
import SwiftUI

struct FavoriteListView: View {
    
    @State private var showDetails = false
    @EnvironmentObject var dataManager : DataManager
    var favoritesViewModel : FavoritesViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(pageTitle: "Your Favorites", pageSubTitle: "")
                
                //ScrollView
                VStack {
                    ScrollView(showsIndicators: false) {
                        ForEach(favoritesViewModel.favoriteMeditations, id: \.id) { meditation in
                            Button(action: {
                                showDetails = true
                            }) {
                                MeditationItemView(meditation: meditation)
                            }
                            
                            .background(
                                NavigationLink(
                                    destination:
                                        MeditationDetailsView(meditation: meditation, favoritesViewModel: FavoritesViewModel())
                                        .navigationBarBackButtonHidden(true),
                                    isActive: $showDetails) { EmptyView() }
                            )
                        }
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .padding()
    }
}

#Preview {
    FavoriteListView(favoritesViewModel: FavoritesViewModel())
}
