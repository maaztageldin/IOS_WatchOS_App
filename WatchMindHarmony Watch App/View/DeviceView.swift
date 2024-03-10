//
//  DeviceView.swift
//  WatchMindHarmony Watch App
//
//  Created by Maaz TAGELDIN on 07/03/2024.
//

import SwiftUI

struct DeviceView: View {
    @State private var livingRoomLightsOn = false
    @State private var livingRoomBlindsOpen = false
    @State private var livingRoomWindowsOpen = false

    var body: some View {
        VStack {
          //  HeaderView(pageTitle: "Devices", pageSubTitle: "Manage your devices")
            
            ScrollView {
                VStack(spacing: 20) {
                    DeviceRowView(deviceName: "Living Room Lights", isOn: livingRoomLightsOn) {
                        // Code pour contrôler les lumières du salon
                        livingRoomLightsOn.toggle()
                    }
                    DeviceRowView(deviceName: "Living Room Blinds", isOn: livingRoomBlindsOpen) {
                        // Code pour contrôler les stores du salon
                        livingRoomBlindsOpen.toggle()
                    }
                    DeviceRowView(deviceName: "Living Room Windows", isOn: livingRoomWindowsOpen) {
                        // Code pour contrôler les fenêtres du salon
                        livingRoomWindowsOpen.toggle()
                    }
                }
                .padding()
            }
        }
    }
}

struct DeviceRowView: View {
    let deviceName: String
    let isOn: Bool
    let action: () -> Void

    var body: some View {
        HStack {
            Text(deviceName)
            Spacer()
            Button(action: action) {
                Text(isOn ? "Turn Off" : "Turn On")
            }
            .padding(6)
            .background(isOn ? Color.red : Color.green)
            .foregroundColor(.white)
            .cornerRadius(8)
            .fixedSize() // Permet d'adapter la taille du bouton
        }
    }
}

// Ajoutez votre vue HeaderView personnalisée ici



#Preview {
    DeviceView()
}
