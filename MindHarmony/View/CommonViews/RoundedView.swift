//
//  RoundedView.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 04/03/2024.
//

import SwiftUI

struct RoundedView: View {
    var boarderColor: Color
    var title: String
    var titleForegroundColor: Color
    var backgroundColor: Color
    var action: () -> Void
    
    var body: some View {
        Text(title)
            .fontWeight(.bold)
            .foregroundColor(titleForegroundColor)
            .padding()

        .frame(width: UIScreen.main.bounds.width / 2)
        .background(
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(backgroundColor)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(boarderColor, lineWidth: 1)
        )
        
    }
}
     
