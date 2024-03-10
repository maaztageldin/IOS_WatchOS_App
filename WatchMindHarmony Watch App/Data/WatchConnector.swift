//
//  WatchConnector.swift
//  WatchMindHarmony Watch App
//
//  Created by Maaz TAGELDIN on 09/03/2024.
//

import Foundation
import WatchConnectivity

class WatchConnector: NSObject, WCSessionDelegate, ObservableObject {
    
    var session: WCSession
    @Published var receivedMessage = ""
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {}

    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        // Récupérer les données reçues
        DispatchQueue.main.async {
            self.receivedMessage = message["message"] as? String ?? ""
            print("Recived message > " + self.receivedMessage)
            UserDefaults.standard.set(self.receivedMessage, forKey: "message")
        }
        /*if let meditationsData = userInfo["MeditationsData"] as? [[String: Any]] {
            let meditations = meditationsData.map { Meditation(dictionary: $0) }
            // Utiliser les données reçues dans votre application WatchOS
            DataManager.shared.meditations = meditations
        }*/
    }
}
