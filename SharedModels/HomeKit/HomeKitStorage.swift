//
//  HomeKitStorage.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 11/03/2024.
//

import HomeKit
import Combine

class HomeKitStorage : NSObject, ObservableObject, HMHomeManagerDelegate {
    @Published var homes: [HMHome] = []
    
    private var hManager: HMHomeManager!
    
    override init() {
            super.init()
            load() 
        }
    
    func load() {
        if hManager == nil {
            hManager = .init()
            
            hManager.delegate = self
        }
    }
    
    func homeManagerDidUpdateHomes(_ manager: HMHomeManager) {
        self.homes = self.hManager.homes
    }
    
    func addHome() {
        
        guard let hManager = hManager else {
                //print("Home manager is nil")
                return
        }
        hManager.addHome(withName: "NewHome\(UUID())") { [weak self] (home, error) in
            
            guard let self = self else {return}
            
            self.homeManagerDidUpdateHomes(self.hManager)
        }
    }
    
    func addAccessory(_ accessory: HMAccessory, to homeId: UUID) {
            guard let home = homes.first(where: { $0.uniqueIdentifier == homeId }) else {
                return
            }
            home.addAccessory(accessory) { error in
                if let error = error {
                    print("Error adding accessory: \(error)")
                } else {
                    print("Accessory added successfully.")
                }
            }
        }
}
