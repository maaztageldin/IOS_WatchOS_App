//
//  DataManager.swift
//  WatchMindHarmony Watch App
//
//  Created by Maaz TAGELDIN on 09/03/2024.
//

import Foundation

class DataManager: ObservableObject {
    @Published var meditations: [Meditation] = []

    init() {
        fetchSharedMeditationData()
    }

    func fetchSharedMeditationData() {
        let sharedContainer = UserDefaults(suiteName: "group.com.esgi.MindHarmony")
        if let meditationsData = sharedContainer?.array(forKey: "MeditationsData") as? [[String: Any]] {
            self.meditations = meditationsData.map { Meditation(dictionary: $0) }
        }
    }
}
