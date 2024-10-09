//
//  LogoView.swift
//  Better
//
//  Created by Nick Ververis on 8/10/24.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [
                Color("MyWhite"),  // pure white
                Color("MyBlack").opacity(0.3)  // pure black
                ],
                startPoint: .top,
                endPoint: .bottom)
            //.padding(.top, 500)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .stroke(Color.black, lineWidth:2)
                        .shadow(color: Color.black.opacity(0.5), radius: 10, x: 5, y: 5)
                        .frame(width: 150, height: 150)
                    Text("B")
                        .font(.system(size:128))
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                }
                Text("Better")
                    .font(.system(size:96))
                    .fontWeight(.bold)
                    .shadow(color: Color.black.opacity(0.5), radius: 10, x: 5, y: 5)
                HStack {
                    Text("simple /")
                    Text("better")
                        .fontWeight(.bold)
                    Text("/ efficient")
                }
                .font(.system(size:12))
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 5, y: 5)
                    
                
                Spacer()
                Spacer()
                Spacer()
                
            }
        }
        
    }
}

#Preview {
    LogoView()
}
