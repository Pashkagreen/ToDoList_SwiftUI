//
//  RegisterViewViewModel.swift
//  ToDo
//
//  Created by Paul Grin on 15/03/2024.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""

    init() {}

    func register() {
        guard validate() else { return }

        // Register user
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, _ in
            guard let userId = result?.user.uid else { return }

            self?.insertUserRecord(id: userId)
        }
    }

    private func insertUserRecord(id: String) {
        let newUser = User(id: id, name: name, email: email, joinedAt: Date().timeIntervalSince1970)

        let db = Firestore.firestore()

        db.collection("users").document(id).setData(newUser.asDictionary())
    }

    private func validate() -> Bool {
        errorMessage = ""

        guard !name.trimmingCharacters(in: .whitespaces).isEmpty, !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please enter valid data"

            return false
        }

        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email"

            return false
        }

        guard password.count >= 6 else { return false }

        return true
    }
}
