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
            VStack {
                if let user = viewModel.user {
                    userProfile(user: user)
                } else {
                    Text("Loading...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }

    @ViewBuilder
    func userProfile(user: User) -> some View {
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125)
            .padding()

        // Info
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                Text(viewModel.user?.name ?? "")
            }

            HStack {
                Text("Email: ")
                    .bold()
                Text(viewModel.user?.email ?? "")
            }

            HStack {
                Text("Member since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: viewModel.user?.joinedAt ?? 0).formatted(date: .abbreviated, time: .shortened))")
            }
        }

        // Sign Out
        Button("Sign Out") {
            viewModel.signOut()
        }
        .tint(.red)
        .padding()

        Spacer()
    }
}

#Preview {
    ProfileView()
}
