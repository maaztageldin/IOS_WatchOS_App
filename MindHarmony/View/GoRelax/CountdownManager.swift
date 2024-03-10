//
//  CountdownManager.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 05/03/2024.
//

import SwiftUI

class CountdownManager: ObservableObject {
    @Published var countdown: Int = 5
    @Published var currentStepIndex: Int = 0
    @Published var isRunning: Bool

    public private(set) var steps: [(text: String, color: Color)] = [
        ("inhalation", .green),
        ("bloque", .gray),
        ("exhalation", .red),
        ("bloque", .gray)
    ]

    init(totalDurationInSeconds: Int, isRunning: Bool) {
        self.countdown = totalDurationInSeconds
        self.isRunning = isRunning
    }

    func startCountdown() {
        guard isRunning else { return }

        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.countdown -= 1
            if self.countdown <= 0 {
                self.currentStepIndex = (self.currentStepIndex + 1) % self.steps.count
                self.countdown = 5 // Réinitialiser le compte à rebours
            }
            if self.countdown == 0 && self.currentStepIndex == 0 {
                timer.invalidate() // Arrêter le timer à la fin des 15 minutes
            }
        }
    }
}
