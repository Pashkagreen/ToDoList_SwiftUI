//
//  LoginView.swift
//  ToDo
//
//  Created by Paul Grin on 15/03/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()

    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "ToDo List", subtitle: "Get things done", angle: 15, background: Color.pink)

                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }

                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)

                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    TLButton(title: "Log In", backgroundColor: .blue) {
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)

                // Create account

                VStack {
                    Text("New around here?")
                    NavigationLink("Create an account?", destination: RegisterView())
                        .padding(.bottom, 50)
                }

                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
