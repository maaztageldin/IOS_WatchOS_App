//
//  ToggleFavorite.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 04/03/2024.
//

import SwiftUI
import FirebaseFirestore

func ToggleFavorite(user: User, meditation: Meditation) {
    var updatedFavorites = user.favorites

    // Si la méditation est déjà dans la liste des favoris la retirer
    if let index = updatedFavorites.firstIndex(of: meditation.id) {
        updatedFavorites.remove(at: index)
    } else { // Sinon, l'ajouter
        updatedFavorites.append(meditation.id)
    }

    // Mettre à jour la liste des favoris
    let db = Firestore.firestore()
    let userRef = db.collection("users").document(user.id ?? "")
    userRef.updateData(["favorites": updatedFavorites]) { error in
        if let error = error {
            print("Error updating favorites: \(error.localizedDescription)")
        } else {
            print("Favorites updated successfully.")
        }
    }
}
