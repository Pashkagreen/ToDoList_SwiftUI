//
//  ToDoApp.swift
//  ToDo
//
//  Created by Paul Grin on 12/03/2024.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
