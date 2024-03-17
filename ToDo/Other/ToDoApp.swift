//
//  ToDoApp.swift
//  ToDo
//
//  Created by Paul Grin on 12/03/2024.
//
import FirebaseAppCheck
import FirebaseCore
import SwiftUI

@main
struct ToDoApp: App {
    init() {
        let providerFactory = AppCheckDebugProviderFactory()
        AppCheck.setAppCheckProviderFactory(providerFactory)

        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
