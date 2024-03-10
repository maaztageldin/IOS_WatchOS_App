//
//  MindHarmonyWatchExtension.swift
//  MindHarmonyWatch
//
//  Created by Maaz TAGELDIN on 09/02/2024.
//

import AppIntents
import SwiftUI
import FirebaseCore

@main
struct MindHarmonyWatchExtension: AppIntentsExtension {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
           WindowGroup {
               ContentView()
           }
       }
}

struct ContentView: View {
    // Définissez les catégories
    let categories = ["Catégorie 1", "Catégorie 2", "Catégorie 3"]

    var body: some View {
        NavigationView {
            List(categories, id: \.self) { category in
                Text(category)
            }
            .navigationTitle("Sélectionnez une catégorie")
        }
    }
}

#Preview {
    ContentView()
}
