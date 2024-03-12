//
//  DataManager.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 04/03/2024.
//

import SwiftUI
import Firebase

class DataManager: ObservableObject {
    @Published var meditations: [Meditation] = []
    
    @State var iPhoneConnector = iPhoneCommunicationManager()
    let db = Firestore.firestore()
    
    init() {
        fetchAllMeditation()
    }
    
    func fetchAllMeditation() {
        meditations.removeAll()
        
        let ref = db.collection("Meditation")
        ref.getDocuments { [self] snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    let id = data["id"] as? String ?? ""
                    let title = data["title"] as? String ?? ""
                    let image = data["image"] as? String ?? ""
                    let reviwCount = data["reviwCount"] as? Int
                    let sound = data["sound"] as? String ?? ""
                    let time = data["time"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    
                    let meditation = Meditation(id: id,title: title, image: image, reviwCount: reviwCount ?? 0, sound: sound, time: time, description: description)
                    self.meditations.append(meditation)
                    
                }
            }
        }
    }
}

