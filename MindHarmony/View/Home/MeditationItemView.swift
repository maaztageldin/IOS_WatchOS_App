//
//  MeditationItemView.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 03/03/2024.
//

import SwiftUI

struct MeditationItemView: View {
    let meditation: Meditation
    
    var body: some View {
        
        ZStack {
            HStack {
                MainMeditationInfo(meditation: meditation)
                Spacer()
            }
            .padding([.leading, .leading], 5)
            .background(Color.lightOrangeColor)
            .cornerRadius(30)
            
        }
    }
}

#Preview {
    MeditationItemView(meditation: Meditation())
}

