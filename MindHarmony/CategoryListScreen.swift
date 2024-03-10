//
//  Category .swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 25/02/2024.
//

import Foundation

import SwiftUI

struct CategoryList: View {
    let categories = ["Catégorie 1", "Catégorie 2", "Catégorie 3"]

        @State private var selectedCategory: String?

        var body: some View {
            
            VStack {

                // Ajoutez une liste de catégories
                List(categories, id: \.self, selection: $selectedCategory) { category in
                    Text(category)
                }
                .navigationTitle("Catégories")
                .listStyle(GroupedListStyle())
            }
        }
}

