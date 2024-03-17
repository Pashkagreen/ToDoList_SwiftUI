//
//  ToDoListItemViewViewModel.swift
//  ToDo
//
//  Created by Paul Grin on 15/03/2024.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

/// View model for a single todo list item view
class ToDoListItemViewViewModel: ObservableObject {
    init() {}

    func toggleIsDone(item: ToDoListItem) {
        var newItem = item
        newItem.setDone(!item.isDone)

        guard let userId = Auth.auth().currentUser?.uid else { return }

        let db = Firestore.firestore()
        db.collection("users").document(userId).collection("todos").document(newItem.id).updateData(newItem.asDictionary())
    }
}
