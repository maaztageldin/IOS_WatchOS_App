//
//  FavoritesViewModel.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 12/03/2024.
//

import Foundation
import Firebase

class FavoritesViewModel: ObservableObject { 
    @Published var favoriteMeditations: [Meditation] = []
    
    let db = Firestore.firestore()
    
    init() {
        
        //Favorite Meditations for connected user
      if let currentUser = Auth.auth().currentUser {
            let userID = currentUser.uid
            fetchFavoriteMeditationsByID(forUserID: userID)
        } else {
            print("You are not connected !")
        }
    }
    
    func fetchFavoriteMeditationsByID(forUserID userID: String) {
        let userRef = db.collection("User").document(userID)
        userRef.getDocument { [weak self] snapshot, error in
            guard let document = snapshot, document.exists else {
                print("Document does not exist")
                return
            }
            
            if let favoriteMeditationIDs = document.data()?["favorites"] as? [String], !favoriteMeditationIDs.isEmpty {
                self?.fetchMeditations(for: favoriteMeditationIDs)
            }
        }
    }

    
    private func fetchMeditations(for meditationIDs: [String]) {
       let ref = db.collection("Meditation").whereField("id", in: meditationIDs)
       
       ref.getDocuments { [weak self] snapshot, error in
           guard let snapshot = snapshot, error == nil else {
               print("Error fetching meditations: \(error!.localizedDescription)")
               return
           }
           
           var favoriteMeditations: [Meditation] = []
           
           for document in snapshot.documents {
               let data = document.data()
               let id = data["id"] as? String ?? ""
               let title = data["title"] as? String ?? ""
               let image = data["image"] as? String ?? ""
               let reviwCount = data["reviwCount"] as? Int ?? 0
               let sound = data["sound"] as? String ?? ""
               let time = data["time"] as? String ?? ""
               let description = data["description"] as? String ?? ""
               
               let meditation = Meditation(id: id, title: title, image: image, reviwCount: reviwCount, sound: sound, time: time, description: description)
               favoriteMeditations.append(meditation)
           }
           
           self?.favoriteMeditations = favoriteMeditations
        }
    }
    
    func addToFavorites(userID: String, meditationID: String) {
        let userRef = db.collection("User").document(userID)
        userRef.getDocument { [weak self] snapshot, error in
            guard let document = snapshot, document.exists else {
                print("Document does not exist")
                return
            }

            var favoriteMeditations = document.data()?["favorites"] as? [String] ?? []
            if !favoriteMeditations.contains(meditationID) {
                favoriteMeditations.append(meditationID)
            }

            userRef.setData(["favorites": favoriteMeditations], merge: true) { error in
                if let error = error {
                    print("Error adding meditation to favorites: \(error.localizedDescription)")
                } else {
                    print("Meditation added to favorites successfully")
                }
            }
        }
    }
    
    func removeFromFavorites(userID: String, meditationID: String) {
        let userRef = db.collection("User").document(userID)
        userRef.getDocument { [weak self] snapshot, error in
            guard let document = snapshot, document.exists else {
                print("Document does not exist")
                return
            }

            var favoriteMeditations = document.data()?["favorites"] as? [String] ?? []
            if let index = favoriteMeditations.firstIndex(of: meditationID) {
                favoriteMeditations.remove(at: index)
            }

            userRef.setData(["favorites": favoriteMeditations], merge: true) { error in
                if let error = error {
                    print("Error removing meditation from favorite: \(error.localizedDescription)")
                } else {
                    print("Meditation removed from favorites successfully")
                }
            }
        }
    }
}

