//
//  UserProfileView.swift
//  MindHarmony
//
//  Created by Maaz TAGELDIN on 10/03/2024.
//


import SwiftUI
import FirebaseAuth

struct UserProfileView: View {
    @State private var name = "John Doe"
    @State private var birthDate = Date()
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker = false
    @State private var showHomeView = false
    @ObservedObject var viewModel = UserProfileViewModel()
    
    var body: some View {
        VStack {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 150, height: 150)
                    .padding()
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 150, height: 150)
                    .padding()
            }

            Button(action: {
                isShowingImagePicker.toggle()
            }) {
                Text("Select Image")
            }
            .padding()

            TextField("Name", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            DatePicker("Birthdate", selection: $birthDate, displayedComponents: .date)
                .datePickerStyle(WheelDatePickerStyle())
                .padding()

            Spacer()
            Button("Save Profile") {
                viewModel.saveUserProfile(name: viewModel.name, dateOfBirth: viewModel.dateOfBirth, photo: "")
                showHomeView = true
            }
            .padding()
            
            Button(action: {
                do {
                    try Auth.auth().signOut()
                } catch let signOutError as NSError {
                    print("Erreur de déconnexion : \(signOutError.localizedDescription)")
                }
            }) {
                Text("Sign Out")
            }
            
            .padding()
            .foregroundColor(.white)
            .background(Color.red)
            .cornerRadius(8)
            .shadow(color: .black, radius: 3, x: 0, y: 2)
            
            NavigationLink(
                destination: HomeView(viewModel: MeditationViewModel()),
                isActive: $showHomeView,
                label: { EmptyView() }
            )
            
        }
        .sheet(isPresented: $isShowingImagePicker) {
            ImagePicker(selectedImage: $selectedImage)
        }
        .navigationBarTitle("Edit Profile")
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedImage = uiImage
            }

            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    @Environment(\.presentationMode) var presentationMode

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    }
}


#Preview {
    UserProfileView()
}

