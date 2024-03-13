//
//  DeviceControlView.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 05/03/2024.
//

import SwiftUI

struct DeviceControlView: View {
    @State private var livingRoomLightsOn = false
    @State private var livingRoomBlindsOpen = false
    @State private var livingRoomWindowsOpen = false

    var body: some View {
        
        VStack {
            HeaderView(pageTitle: "Devices", pageSubTitle: "Manage your device  ")
            
            VStack(spacing: 20) {
                ScrollView(showsIndicators: false) {
                    DeviceRowView(deviceName: "Living Room Lights", isOn: $livingRoomLightsOn) {
                        livingRoomLightsOn.toggle()
                    }
                    DeviceRowView(deviceName: "Living Room Blinds", isOn: $livingRoomBlindsOpen) {
                        livingRoomBlindsOpen.toggle()
                    }
                    DeviceRowView(deviceName: "Living Room Windows", isOn: $livingRoomWindowsOpen) {
                        livingRoomWindowsOpen.toggle()
                    }
                }
                .padding()
                .navigationBarTitle("Device Control")
            }
        }
    }
}

struct DeviceRowView: View {
    let deviceName: String
    @Binding var isOn: Bool
    let action: () -> Void

    var body: some View {
        HStack {
            Text(deviceName)
            Spacer()
            Button(action: action) {
                Text(isOn ? "Turn Off" : "Turn On")
            }
            .padding(10)
            .background(isOn ? Color.red : Color.green)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }
}


#Preview {
    DeviceControlView()
}
