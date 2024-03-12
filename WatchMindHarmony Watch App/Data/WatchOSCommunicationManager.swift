//
//  WatchOSCommunicationManager.swift
//  WatchMindHarmony Watch App
//
//  Created by Maaz TAGELDIN on 09/03/2024.
//

import Foundation
import WatchConnectivity

class WatchOSCommunicationManager: NSObject, WCSessionDelegate, ObservableObject {
    
    var session: WCSession

    init(session: WCSession = .default) {
        self.session = session
        super.init()
        session.delegate = self
        session.activate()
        }

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
       
    }
    
    func sendDataToIPhone() {
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print(message)
    }
    
    func sendMeditationsRequestToIPone() {
        if session.isReachable {
            print("reachable .... sending data")
            let data: [String: Any] = [
                        "GetMeditationList": "Request for meditation list"
                    ]
            
            session.sendMessage(data, replyHandler: nil) { error in
                print("problem sending the data ####")
                
            }
        } else {
            print("session is not reachable")
        }
    }
}
