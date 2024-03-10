//
//  MainMeditationInfo.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 03/03/2024.
//

import SwiftUI

struct MainMeditationInfo: View {
    let meditation: Meditation
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("4.5")
                    .font(.system(size: 12))
                    .frame(width: 40, height: 20)
                    .foregroundColor(.white)
                    .background(Color.indigo)
                    .cornerRadius(15)
                    
                    
                
                Text("\(String(meditation.reviwCount)) review")
                    .foregroundColor(.gray)
                    .font(.caption2)
            }
            
            Text(meditation.title)
                .foregroundColor(.indigo)
                .font(.largeTitle)
                .lineLimit(2)
            
            Text(meditation.time)
                .foregroundColor(.indigo)
                .font(.caption)
            
            // modeInfoView
            modeInfoView(modeImage: meditation.image, modDescription: meditation.description)
        }
        .padding()
    }
    
    struct modeInfoView: View {
        
        var modeImage: String
        var modDescription: String
        
        var body: some View {
            HStack {
                Image(modeImage)
                Text(modDescription)
                    .foregroundColor(.gray)
                    .font(.caption2)
            }
            .padding([.top, .bottom], 10)
        }
    }
}
      
