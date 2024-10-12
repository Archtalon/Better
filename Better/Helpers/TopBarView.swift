//
//  TopBarView.swift
//  Better
//
//  Created by Nick Ververis on 11/10/24.
//

import SwiftUI

struct TopBarView: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color("MyWhite"))
                    .frame(height: 120) // Define height directly
                    .ignoresSafeArea(edges: .top)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("MyWhite"))
                    .frame(width: 30, height: 30)
                    .overlay(
                        Text("B")
                            .font(.system(size: 12))
                            .fontWeight(.bold)
                            .foregroundColor(Color("MyBlack"))
                    )
                    .shadow(color: Color("MyBlack").opacity(0.5), radius: 10, x: 5, y: 5)
                    .padding(.top, 20)
            }
        }
        .frame(maxWidth: .infinity, alignment: .top)
    }
}

#Preview {
    TopBarView()
}

