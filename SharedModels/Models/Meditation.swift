//
//  Meditaion.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 03/03/2024.
//

import Foundation

struct Meditation: Identifiable, Hashable, Codable {
    let id: String
    let title: String
    let image: String
    let reviwCount: Int
    let sound: String
    let time: String
    let description: String
    
    init(id: String = "",
         title: String = "",
         image: String = "",
         reviwCount: Int = 0,
         sound: String = "",
         time: String = "",
         description: String = ""
    ) {
        self.id = id
        self.title = title
        self.image = image
        self.reviwCount = reviwCount
        self.sound = sound
        self.time = time
        self.description = description
    }
    
    // Convertir le modèle en dictionnaire
       func toDictionary() -> [String: Any] {
           return [
               "id": id,
               "title": title,
               "image": image,
               "reviwCount": reviwCount,
               "sound": sound,
               "time": time,
               "description": description
           ]
       }
    
    
    init(dictionary: [String: Any]) {
           self.id = dictionary["id"] as? String ?? ""
           self.title = dictionary["title"] as? String ?? ""
           self.image = dictionary["image"] as? String ?? ""
           self.reviwCount = dictionary["reviwCount"] as? Int ?? 0
           self.sound = dictionary["sound"] as? String ?? ""
           self.time = dictionary["time"] as? String ?? ""
           self.description = dictionary["description"] as? String ?? ""
       }
}
