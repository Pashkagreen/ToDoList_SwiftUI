//
//  LoginView.swift
//  ToDo
//
//  Created by Paul Grin on 15/03/2024.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""

    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "ToDo List", subtitle: "Get things done", angle: 15, background: Color.pink)

                // Login form
                Form {
                    TextField("Email Address", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button {
                        // Log In
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue)

                            Text("Log In")
                                .foregroundColor(Color.white)
                                .bold()
                        }
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
