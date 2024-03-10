//
//  MenuView.swift
//  WatchMindHarmony Watch App
//
//  Created by Maaz TAGELDIN on 08/03/2024.
//

import SwiftUI

struct MenuView: View {
    @StateObject var dataManager = DataManager()
    @State var watchConnector = WatchOSCommunicationManager()
    
    var body: some View {
        GeometryReader { reader in
            let rect = reader.frame(in: .global)
            VStack(spacing: 15) {
                HStack(spacing: 25) {
                    
                    NavigationLink(
                        destination: HomeView()
                            .environmentObject(dataManager),
                        label: {
                            NavButton(image: "house",
                                      title: "Home",
                                      rect: rect,
                                      color: Color("pink"))
                        })
                        .buttonStyle(PlainButtonStyle())
                        .onAppear {
                                watchConnector.sendMeditationsRequestToIPone()
                            }
                    
                    NavigationLink(
                        destination: FavoriteView(),
                        label: {
                            NavButton(image: "suit.heart",
                                      title: "Favorite",
                                      rect: rect,
                                      color: Color("pink"))
                        })
                        .buttonStyle(PlainButtonStyle())
                }
                .frame(width: rect.width, alignment: .center)
                
                HStack(spacing: 25) {
                    
                    NavigationLink(destination: DeviceView(),
                                   label: {
                                    NavButton(image: "tv.and.mediabox.fill",
                                              title: "Device",
                                              rect: rect,
                                              color: Color("pink"))
                                   })
                        .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(destination: ProfileView(),
                                   label: {
                                    NavButton(image: "person.crop.circle",
                                              title: "Profile",
                                              rect: rect,
                                              color: Color("pink"))
                                   })
                        .buttonStyle(PlainButtonStyle())
                }
                .frame(width: rect.width, alignment: .center)
            }
        }
    }
}

struct NavButton: View {
    var image: String
    var title: String
    var rect: CGRect
    var color: Color
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: image)
                .font(.title2)
                .frame(width: rect.width / 3, height: rect.width / 3, alignment: .center)
                .background(Color.indigo)
                .clipShape(Circle())
            
            Text(title)
                .font(.system(size: 10))
                .foregroundColor(.white)
        }
    }
}

struct FavoriteView: View {
    var body: some View {
        Text("Favorite View")
    }
}


#Preview {
    MenuView()
}
