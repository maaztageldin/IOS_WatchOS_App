//
//  HomeListPage.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 11/03/2024.
//

import SwiftUI
import HomeKit

/*struct HomesListPage : View {
    
    @ObservedObject var model: HomesListPageModel
    
    @State private var selectedHome: UUID? = nil
    
    var body: some View {
        //ContentVi()
        List {
            Section(header: HStack {
                
                Text("My Homes")
                Button(action: model.addHome) { Text("Add Home")}
                
            }) {
                ForEach(model.homes, id: \.id) { home in
                    
                    NavigationLink(
                        destination: HomePageViewContainer(homeId: home.id),
                        tag: home.id,
                        selection: $selectedHome) {
                            Text(home.name)
                        }
                }
            }
            
        }
    }
}*/
struct HomesListPage: View {
    
    @ObservedObject var model: HomesListPageModel
    
    @State private var selectedHome: UUID? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AccessoryDiscoveryView()) {
                    Text("Find accessories")
                }
                
                /*List {
                    Section(header: HStack {
                        
                        Text("My Homes")
                        Button(action: model.addHome) { Text("Add Home")}
                        
                    }) {
                        ForEach(model.homes, id: \.id) { home in
                            
                            NavigationLink(
                                destination: HomePageViewContainer(homeId: home.id),
                                tag: home.id,
                                selection: $selectedHome) {
                                    Text(home.name)
                                }
                        }
                    }
                    
                }*/
            }
            .navigationBarTitle("My Homes")
        }
    }
}


struct AccessoryDiscoveryView: View {
    @ObservedObject var accessoryManager = AccessoryManager()

    var body: some View {
        List(accessoryManager.accessories, id: \.self) { accessory in
            Text(accessory.name)
        }
        .onAppear {
            self.accessoryManager.startSearching()
        }
    }
}

class HomesListPageModel: ObservableObject {
    
    @Published var homes: [HomeListItem] = []
    
    private let homeKitStorage: HomeKitStorage
    
    init(_ homeKitStorage: HomeKitStorage) {
        
        self.homeKitStorage = homeKitStorage
        manageHomes()
    }
    
    func addHome() {
        homeKitStorage.addHome()
    }
    
    private func manageHomes() {
        homeKitStorage.$homes.map { homes in
            
            homes.map { home in .init(id: home.uniqueIdentifier, name: home.name)}
            
        }.assign(to: &$homes)
    }
}


class AccessoryManager: NSObject, ObservableObject, HMAccessoryBrowserDelegate {
    @Published var accessories: [HMAccessory] = []

    private var accessoryBrowser: HMAccessoryBrowser!

    override init() {
        super.init()
        accessoryBrowser = HMAccessoryBrowser()
        accessoryBrowser.delegate = self
    }

    func startSearching() {
        accessoryBrowser.startSearchingForNewAccessories()
    }

    func accessoryBrowser(_ browser: HMAccessoryBrowser, didFindNewAccessory accessory: HMAccessory) {
        DispatchQueue.main.async {
            self.accessories.append(accessory)
        }
    }

    func accessoryBrowser(_ browser: HMAccessoryBrowser, didRemoveNewAccessory accessory: HMAccessory) {
        DispatchQueue.main.async {
            if let index = self.accessories.firstIndex(of: accessory) {
                self.accessories.remove(at: index)
            }
        }
    }
}

struct HomeListItem {
    var id: UUID
    var name: String
}
