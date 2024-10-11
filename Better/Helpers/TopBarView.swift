//
//  TopBarView.swift
//  Better
//
//  Created by Nick Ververis on 11/10/24.
//

import SwiftUI

struct TopBarView: View {
    var body: some View {
        // Anchored logo at the top
        VStack {
            ZStack {
                Rectangle()
                    .stroke(Color("MyWhite"), lineWidth: /*@START_MENU_TOKEN@*/4.0/*@END_MENU_TOKEN@*/)
                    .fill(Color("MyWhite"))
                    .frame(width: .infinity, height: 120)
                    .ignoresSafeArea()
                    .padding(.bottom, 95)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("MyWhite"))
                    .stroke(Color("MyBlack"), lineWidth:2)
                    .shadow(color: Color("MyBlack").opacity(0.5), radius: 10, x: 5, y: 5)
                    .frame(width: 30, height: 30)
                    .padding(.bottom, 150) // Adjust top padding to anchor the logo near the top
                Text("B")
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                    .foregroundColor(Color("MyBlack"))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 150) // Adjust top padding to anchor the logo near the top
            }
        }
        .frame(maxWidth: .infinity, alignment: .top) // Align logo to the top
    }
}

#Preview {
    TopBarView()
}
