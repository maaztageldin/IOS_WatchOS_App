//
//  UserProfileViewModel.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 10/03/2024.
//

import Foundation
import Firebase

class UserProfileViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var dateOfBirth: String = ""
    @Published var photo: UIImage?
    @Published var isDataLoaded: Bool = false
    
    private let db = Firestore.firestore()
    private let currentUser = Auth.auth().currentUser
    
    init() {

    }
    
    func fetchUserProfile() {
        guard let userID = currentUser?.uid else { return }
        
        db.collection("User").document(userID).getDocument { [weak self] document, error in
            guard let document = document, document.exists, let data = document.data() else { return }
            
            self?.name = data["name"] as? String ?? ""
            self?.dateOfBirth = data["dateOfBirth"] as? String ?? ""
            //self?.photo = data["photo"] as? String ?? ""
            
            if let profileImageURLString = data["photo"] as? String {
                       // Fetch profile image from URL
                       if let url = URL(string: profileImageURLString) {
                           URLSession.shared.dataTask(with: url) { data, response, error in
                               if let data = data {
                                   self?.photo = UIImage(data: data)
                               }
                           }.resume()
                       }
                   }
            
            self?.isDataLoaded = true
        }
    }
    
    func saveUserProfile(name: String, dateOfBirth: String, photo: String) {
        guard let userID = Auth.auth().currentUser?.uid else {
            print("Error: Current user ID not found")
            return
        }

        let userData: [String: Any] = [
            "name": name,
            "dateOfBirth": dateOfBirth,
            "photo": photo
        ]

        let db = Firestore.firestore()
        db.collection("User").document(userID).setData(userData, merge: true) { error in
            if let error = error {
                print("Error saving user profile: \(error.localizedDescription)")
            } else {
                print("User profile saved successfully")
            }
        }
    }
}
