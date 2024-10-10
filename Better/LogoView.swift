//
//  LogoView.swift
//  Better
//
//  Created by Nick Ververis on 8/10/24.
//

import SwiftUI

struct LogoView: View {
    
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        ZStack {
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
                Spacer()
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("MyWhite"))
                        .stroke(Color("MyBlack"), lineWidth:2)
                        .shadow(color: Color("MyBlack").opacity(0.5), radius: 10, x: 5, y: 5)
                        .frame(width: 150, height: 150)
                    Text("B")
                        .font(.system(size:128))
                        .fontWeight(.bold)
                        .foregroundColor(Color("MyBlack"))
                        .multilineTextAlignment(.center)
                }
                Text("Better")
                    .font(.system(size:96))
                    .fontWeight(.bold)
                    .shadow(color: Color("MyBlack").opacity(0.5), radius: 10, x: 5, y: 5)
                HStack {
                    Text("simple /")
                    Text("better")
                        .fontWeight(.bold)
                    Text("/ efficient")
                }
                .font(.system(size:12))
                .shadow(color: Color("MyBlack").opacity(0.5), radius: 10, x: 5, y: 5)
                    
                
                Spacer()
                Spacer()
                Spacer()
                
            }
        }
        .colorScheme(.light)
        
    }
}
    

#Preview {
    LogoView()
}
