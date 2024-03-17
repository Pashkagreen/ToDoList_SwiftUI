//
//  ProfileView.swift
//  ToDo
//
//  Created by Paul Grin on 15/03/2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()

    var body: some View {
        NavigationView {
            VStack {}
                .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
