//
//  ToDoListItemsView.swift
//  ToDo
//
//  Created by Paul Grin on 15/03/2024.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]

    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }

    var body: some View {
        NavigationView {
            VStack {
                List(self.items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                self.viewModel.delete(itemId: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("ToDo List")
            .toolbar {
                Button {
                    self.viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: self.$viewModel.showingNewItemView) {
                NewItemView(newItemPresented: self.$viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "tV3KRm3f8QWZFcrev4zaOpFVwG32")
}
