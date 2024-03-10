//
//  ExtensionDelegate.swift
//  WatchMindHarmony Watch App
//
//  Created by Maaz TAGELDIN on 09/03/2024.
//

import Foundation
import WatchKit
import WatchConnectivity

class ExtensionDelegat: NSObject, WKExtensionDelegate, WCSessionDelegate {

    func applicationDidFinishLaunching() {
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {}

    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        // Récupérer les données reçues
        if let meditationsData = userInfo["MeditationsData"] as? [[String: Any]] {
            let meditations = meditationsData.map { Meditation(dictionary: $0) }
            // Utiliser les données reçues dans votre application WatchOS
            DataManager.shared.meditations = meditations
        }
    }
}
