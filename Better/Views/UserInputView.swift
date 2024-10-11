//
//  UserInputView.swift
//  Better
//
//  Created by Nick Ververis on 11/10/24.
//

import SwiftUI

struct UserInputView: View {
    var body: some View {
        
        ZStack(alignment: .top) {
            LinearGradient(
                gradient: Gradient(stops: [
                    Gradient.Stop(color:Color("MyWhite"), location: 0.0),   // Start color
                    Gradient.Stop(color:Color("MyWhite"), location: 0.5),  // Middle color stop
                    Gradient.Stop(color:Color("MyBlack"), location: 1.0)  // End color
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            VStack {
                TopBarView()
                Spacer()
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .navigationBarBackButtonHidden(true)
                    .foregroundColor(Color("MyBlack"))
                Spacer()
            }
            //Spacer()
            //TopBarView()
        }
    }
    
}

#Preview {
    UserInputView()
}
