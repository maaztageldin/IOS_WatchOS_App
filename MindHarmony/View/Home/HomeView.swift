//
//  HomeView.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 02/03/2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: MeditationViewModel
    @EnvironmentObject var dataManager : DataManager
    
    @State private var showDetails : Array = Array(repeating: false, count: 5)
    
    var body: some View {
        NavigationView {
            //Header View
            VStack {
                HeaderView(pageTitle: "Select your category", pageSubTitle: "Relaxation mode")
                
                //Search View
                SearchBarView(searchText: $viewModel.searchText)
        
                //ScrollView
                VStack {
                    ScrollView(showsIndicators: false) {
                        ForEach(dataManager.meditations, id: \.id) { meditation in
                            //Meditation View
                            
                            Button(action: {
                                showDetails[1].toggle()
                            }) {
                                MeditationItemView(meditation: meditation)
                                    .environmentObject(dataManager)
                            }
                            
                            .background(
                                NavigationLink(
                                    destination:
                                        MeditationDetailsView(meditation: meditation, favoritesViewModel: FavoritesViewModel())
                                        .navigationBarBackButtonHidden(true)
                                    ,
                                    isActive: $showDetails[1]) { EmptyView() }
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
    HomeView(viewModel: MeditationViewModel())
}
