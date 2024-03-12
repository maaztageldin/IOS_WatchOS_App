//
//  HeaderView.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 02/03/2024.
//

import SwiftUI

struct HeaderView: View {
    var pageTitle: String
    var pageSubTitle: String
    @ObservedObject var viewModel = UserProfileViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination: UserProfileView()) {
                HStack {
                    Text("Hello,")
                        .foregroundColor(Color.gray)
                    Text(viewModel.name)
                        .foregroundColor(Color.gray)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Image("ProfilePic")
                        .resizable()
                        .padding(3)
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                        .overlay(
                            Circle()
                                .stroke(Color.indigo, lineWidth: 2)
                        )
                }
                .padding()
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(pageTitle)
                    .foregroundColor(Color.gray)
                
                Text(pageSubTitle)
                    .font(.title)
                    .foregroundColor(Color.gray)
                    .fontWeight(.bold)
            }
            .padding()
        }
    }
}
