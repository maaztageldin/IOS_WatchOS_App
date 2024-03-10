//
//  MeditationDetailView.swift
//  WatchMindHarmony Watch App
//
//  Created by Maaz TAGELDIN on 10/03/2024.
//

import SwiftUI
import AVFAudio

struct MeditationDetailView: View {
    let meditation: Meditation
    @State private var isPlaying: Bool = false
    @State private var player: AVAudioPlayer?

    var body: some View {
        VStack {
            //Spacer()
            Header(isPlaying: $isPlaying, image: meditation.image, player: player)
                .padding(.top)
            
            VStack(alignment: .leading) {
                Text(meditation.title)
                    .foregroundColor(Color.indigo)
                    .padding(.horizontal)
                
                Text("\(meditation.time)")
                    .foregroundColor(Color.gray)
                    .padding(.horizontal)
                    //.padding(.bottom, 5)
               
            }
        }
        .onAppear {
            //if let soundURL = Bundle.main.url(forResource: meditation.sound, withExtension: "mp3") {
            if let soundURL = Bundle.main.url(forResource: "relaxation-1", withExtension: "mp3") {
                do {
                    self.player = try AVAudioPlayer(contentsOf: soundURL)
                } catch {
                    print("Error loading audio file:", error.localizedDescription)
                }
            }
        }
        CountdownView()
            .padding(.bottom, 10)
    }
}

struct Header: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isFavorite: Bool = false
    @Binding var isPlaying: Bool
    var image: String
    var player: AVAudioPlayer?
    
    
    var body: some View {
        ZStack {
            Button(action: {
                togglePlay()
            }) {
                Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                }
        }
        .padding()
    }
    
    func toggleFavorite() {
        isFavorite.toggle()
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


#Preview {
    MeditationDetailView(meditation: Meditation())
}
