//
//  SearchBarView.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 02/03/2024.
//

import SwiftUI

struct SearchBarView: UIViewRepresentable {
    
    typealias UIViewType = UISearchBar
    @Binding var searchText: String
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Mood ..."
        return searchBar
    }
    
    func makeCoordinator() -> SearchBarCoordinator {
        return SearchBarCoordinator(searchText: $searchText)
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        
    }
}

class SearchBarCoordinator: NSObject, UISearchBarDelegate {
    @Binding var searchText: String
    
    init(searchText: Binding<String>) {
        _searchText = searchText
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchText = searchBar.text ?? ""
        UIApplication.shared.windows.first { $0.isKeyWindow
        }?.endEditing(true)
    }
}
