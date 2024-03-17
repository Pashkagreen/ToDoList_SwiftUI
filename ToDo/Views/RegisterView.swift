//
//  RegisterView.swift
//  ToDo
//
//  Created by Paul Grin on 15/03/2024.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "Register", subtitle: "Start organizing todos", angle: -15, background: Color.yellow)

            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
