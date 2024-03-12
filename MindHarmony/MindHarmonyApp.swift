//
//  MindHarmonyApp.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 09/02/2024.
//

import SwiftUI
import FirebaseCore

@main
struct MindHarmonyApp: App {
    @StateObject var dataManager = DataManager()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataManager)
        }
    }
}
