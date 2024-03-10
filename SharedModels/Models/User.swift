//
//  User.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 03/03/2024.
//

import SwiftUI
import Foundation

struct User: Codable, Identifiable {
    var id: String?
    var email: String
    var name: String
    var dateOfBirth: Date
    var photo: String?
    var favorites: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case name
        case dateOfBirth
        case photo
        case favorites
    }
}
