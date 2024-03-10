//
//  SignInHeader.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 01/03/2024.
//

import SwiftUI

struct SignInHeader: View {
    var title: String
    var subTitle: String
    
    var body: some View {
        VStack {
            Image("")
            
            Text(title)
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.medium)
                .padding(.vertical, 5)
            Text(subTitle)
                .foregroundColor(.white)
                .font(.callout)
            }
        .padding(.top, 100)
    }
}
