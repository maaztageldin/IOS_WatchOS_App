import SwiftUI
import FirebaseCore

struct ContentView: View {
    
    @ObservedObject var dataManager = DataManager()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("MindHarmony")
                    .font(.title3)
                    .padding()
                
                NavigationLink(destination: MenuView()
                    .environmentObject(dataManager)) {
                    Text("Start")
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.indigo)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .buttonStyle(PlainButtonStyle())
                .padding()
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let dataManager = DataManager() 
        return ContentView().environmentObject(dataManager)
    }
}
