//
//  HomeView.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 02/03/2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: MeditationViewModel
    @State private var showDetails = false
    @EnvironmentObject var dataManager : DataManager
    //@State private var selectedItem =
    
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
                                showDetails = true
                            }) {
                                MeditationItemView(meditation: meditation)
                            }
                            
                            .background(
                                NavigationLink(
                                    destination:
                                        MeditationDetailsView(meditation: meditation)
                                        .navigationBarBackButtonHidden(true)
                                        //.environmentObject(dataManager)
                                    ,
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
    HomeView(viewModel: MeditationViewModel())
}
