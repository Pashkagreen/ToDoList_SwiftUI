//
//  HeaderView.swift
//  ToDo
//
//  Created by Paul Grin on 16/03/2024.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))

            VStack {
                Text(title)
                    .foregroundColor(Color.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/ .bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 50))

                Text(subtitle)
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -150)
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, background: Color.blue)
}
