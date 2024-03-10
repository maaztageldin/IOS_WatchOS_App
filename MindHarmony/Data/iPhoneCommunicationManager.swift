//
//  iPhoneCommunicationManager.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 09/03/2024.
//

import Foundation
import WatchConnectivity

class iPhoneCommunicationManager: NSObject, WCSessionDelegate, ObservableObject {
    
    var session: WCSession

    init(session: WCSession = .default) {
        self.session = session
        super.init()
        session.delegate = self
        session.activate()
        }

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error rror: Error?) {
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        //print("activate")
    }

    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("Message recived")
        print(message)
    }
   
    func sendMeditationsToWatch(meditations: [Meditation]) {
       /* if session.isReachable {
            do {
                let data = try JSONEncoder().encode(meditations)
                session.sendMessage(["meditations": data], replyHandler: nil) { error in
                    print("Error sending meditations to Watch: \(error.localizedDescription)")
                }
            } catch {
                print("Error encoding meditations: \(error.localizedDescription)")
            }
        } else {
            print("Watch is not reachable")
        }*/
    }
    
    func test() {
        let session = WCSession.default
        guard session.isPaired && session.isWatchAppInstalled else {
            return
        }
        print("reachable .... sending data Iphone")
        session.transferUserInfo(["lastName": "Tageldin"])
    }
}
