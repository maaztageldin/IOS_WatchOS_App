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
            
            ScrollView {
                VStack(spacing: 20) {
                    DeviceRowView(deviceName: "Living Room Lights", isOn: livingRoomLightsOn) {
                        
                        livingRoomLightsOn.toggle()
                    }
                    DeviceRowView(deviceName: "Living Room Blinds", isOn: livingRoomBlindsOpen) {
                    
                        livingRoomBlindsOpen.toggle()
                    }
                    DeviceRowView(deviceName: "Living Room Windows", isOn: livingRoomWindowsOpen) {
                    
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
            .fixedSize()
        }
    }
}

#Preview {
    DeviceView()
}
