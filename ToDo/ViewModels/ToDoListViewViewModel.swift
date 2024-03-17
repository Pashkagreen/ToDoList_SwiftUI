//
//  ToDoListViewViewModel.swift
//  ToDo
//
//  Created by Paul Grin on 15/03/2024.
//
import FirebaseFirestore
import Foundation

/// View model for list of items view
/// Primary tab
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView: Bool = false

    private let userId: String

    init(userId: String) {
        self.userId = userId
    }

    func delete(itemId: String) {
        let db = Firestore.firestore()

        db.collection("users").document(userId).collection("todos").document(itemId).delete()
    }
}
