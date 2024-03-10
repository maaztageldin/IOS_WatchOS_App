//
//  ProfileView.swift
//  WatchMindHarmony Watch App
//
//  Created by Maaz TAGELDIN on 07/03/2024.
//

import SwiftUI

struct ProfileView: View {
    @State private var profileImage: Image = Image(systemName: "person.circle.fill")
    @State private var username: String = "John Doe"
    @State private var birthDate: Date = Date()
    @State private var isEditingPhoto: Bool = false
    @State private var isEditingName: Bool = false
    @State private var isEditingBirthDate: Bool = false

    var body: some View {
        VStack {
            profileImage
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .onTapGesture {
                    isEditingPhoto.toggle()
                }
                .sheet(isPresented: $isEditingPhoto) {
                    ImagePicker(image: $profileImage)
                }
            
            Text("Username: \(username)")
                .padding()
                .font(.system(size: 10))
                .foregroundColor(.white)
                .onTapGesture {
                    isEditingName.toggle()
                }
                .sheet(isPresented: $isEditingName) {
                    EditTextView(title: "Username", text: $username)
                }
            
            Text("Birth Date: \(formattedBirthDate)")
                .padding()
                .font(.system(size: 10))
                .foregroundColor(.white)
                .onTapGesture {
                    isEditingBirthDate.toggle()
                }
                .sheet(isPresented: $isEditingBirthDate) {
                    EditDateView(date: $birthDate)
                }
            
            Spacer()
        }
        .padding()
    }
    
    var formattedBirthDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        return dateFormatter.string(from: birthDate)
    }
}

// Vue pour sélectionner une nouvelle photo de profil
struct ImagePicker: View {
    @Binding var image: Image
    
    var body: some View {
        // Implémentez ici la logique pour choisir une nouvelle image
        // Utilisez UIImagePickerController ou une autre méthode
        Text("Select Image")
    }
}

// Vue pour modifier du texte
struct EditTextView: View {
    let title: String
    @Binding var text: String
    
    var body: some View {
        // Implémentez ici la logique pour modifier du texte
        TextField("Enter \(title)", text: $text)
            .padding()
    }
}

// Vue pour modifier la date
struct EditDateView: View {
    @Binding var date: Date
    
    var body: some View {
        // Implémentez ici la logique pour modifier la date
        DatePicker("Select Date", selection: $date, displayedComponents: .date)
            .datePickerStyle(WheelDatePickerStyle())
            .labelsHidden()
            .padding()
    }
}



#Preview {
    ProfileView()
}
