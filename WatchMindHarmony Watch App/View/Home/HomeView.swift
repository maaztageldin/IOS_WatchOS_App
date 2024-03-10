//
//  HomeView.swift
//  WatchMindHarmony Watch App
//
//  Created by Maaz TAGELDIN on 07/03/2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var dataManager : DataManager
    @State var watchConnector = WatchOSCommunicationManager()
    //@ObservedObject var watchConnector = WatchConnector()

    var body: some View {
        
        List(meditations, id: \.id) { meditation in
            MeditationRowView(meditation: meditation)
                //.environmentObject(DataManager())
                .onAppear() {
                }
        }
        
    }
        
}
    
struct MeditationRowView: View {
    let meditation: Meditation
    @State private var isDetailActive = false

    var body: some View {
        NavigationLink(
            destination: MeditationDetailView(meditation: meditation),
            isActive: $isDetailActive
        ) {
            HStack {
                Image(meditation.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)

                VStack(alignment: .leading) {
                    Text(meditation.title)
                        .font(.headline)
                        .foregroundColor(Color.indigo)
                    Text("Time: \(meditation.time)")
                        .font(.subheadline)
                        .foregroundColor(Color.indigo)
                }
                .padding()
            }
            .padding()
            
            .cornerRadius(30)
            .buttonStyle(PlainButtonStyle())
            .onTapGesture {
                isDetailActive = true
            }
            
        }
       // .background(Color.lightOrangeColor)
    }
}


#Preview {
    HomeView()
}

let meditations: [Meditation] = [
    Meditation(id: "1",
                title: "Meditation 1",
                image: "meditation1",
                reviwCount: 10,
                sound: "meditation_sound_1",
                time: "10 min",
                description: "Description for meditation 1"),
    
    Meditation(id: "2",
                title: "Meditation 2",
                image: "meditation2",
                reviwCount: 15,
                sound: "meditation_sound_2",
                time: "15 min",
                description: "Description for meditation 2"),
    
    Meditation(id: "3",
                title: "Meditation 3",
                image: "meditation3",
                reviwCount: 8,
                sound: "meditation_sound_3",
                time: "12 min",
                description: "Description for meditation 3"),
    
    // Ajoutez autant de données fictives que nécessaire
]
