//
//  MeditationDetailsView.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 03/03/2024.
//

import SwiftUI
import AVFAudio
import FirebaseAuth

struct MeditationDetailsView: View {
    
    let meditation: Meditation
    @State private var isPlaying: Bool = false
    @State private var player: AVAudioPlayer?
    @State private var isFavorite: Bool = false
    @EnvironmentObject var dataManager : DataManager
    var favoritesViewModel : FavoritesViewModel
    
    
    var body: some View {
        VStack {
            //Header(image: "med-2")
            Header(meditation : meditation, favoritesViewModel: favoritesViewModel, isPlaying: $isPlaying, image: "med-2", player: player )
                .environmentObject(dataManager)
            
            VStack(alignment: .leading) {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        HStack {
                            Text(meditation.title)
                                .foregroundColor(Color.indigo)
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.horizontal)
                                .padding(.vertical, 10)
                            Text(meditation.time + " minutes")
                                .foregroundColor(Color.gray)
                        }
                        .onAppear {
                            if let soundURL = Bundle.main.url(forResource: meditation.sound, withExtension: "mp3") {
                                do {
                                    self.player = try AVAudioPlayer(contentsOf: soundURL)
                                    
                                } catch {
                                    print("Erreur lors du chargement du fichier audio:", error.localizedDescription)
                                }
                            }
                        }
            
                        CountdownView()
                        
                    }
                }
                
            }
                   
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
       
    }
    

}


//exhalation
struct Header: View {
    let meditation: Meditation
    var favoritesViewModel : FavoritesViewModel
    @EnvironmentObject var dataManager : DataManager
    @Environment(\.presentationMode) var presentationMode
    @State private var isFavorite: Bool = false
    @Binding var isPlaying: Bool
    var image: String
    var player: AVAudioPlayer?
    
    
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height:
                        UIScreen.main.bounds.height / 2)
                .corcornerRadius(55, corners: [.bottomLeft, .bottomRight])
            Button(action: {
                togglePlay()
            }) {
                Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                }

        }
        .navigationBarItems(
            leading:
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .font(.title)
                        .foregroundColor(Color.black.opacity(0.5))
                },
            trailing:
                Button(action: {
                    toggleFavorite()
                }) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .font(.title)
                        .foregroundColor(isFavorite ? .red : .black.opacity(0.5))
                }
        )
    }
    
    func toggleFavorite() {
        if let currentUser = Auth.auth().currentUser {
            let userID = currentUser.uid
            
            isFavorite.toggle()
            if isFavorite {
                favoritesViewModel.addToFavorites(userID: userID, meditationID: meditation.id)
            } else {
                favoritesViewModel.removeFromFavorites(userID: userID, meditationID: meditation.id)
            }
        } else {
            print("You are not connected !")
        }
    }
    
   
    
    func togglePlay() {
           isPlaying.toggle()
           if isPlaying {
              // CountdownView.startCountdown(isPlaying: true)
               player?.play()
           } else {
               player?.pause()
               //CountdownView.startCountdown(isPlaying: false)
           }
       }
}


//struct addToFavorites {}

/*
struct RoundedCornerDetailsView: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, 
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}*/

extension View {
    func corcornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

#Preview {
    MeditationDetailsView(meditation: Meditation(), favoritesViewModel: FavoritesViewModel())
}
