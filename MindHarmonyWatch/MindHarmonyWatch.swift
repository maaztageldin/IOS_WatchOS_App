//
//  MindHarmonyWatch.swift
//  MindHarmonyWatch
//
//  Created by Maaz TAGELDIN on 09/02/2024.
//

import AppIntents

struct MindHarmonyWatch: AppIntent {
    static var title: LocalizedStringResource = "MindHarmonyWatch"
    
    func perform() async throws -> some IntentResult {
        return .result()
    }
}
