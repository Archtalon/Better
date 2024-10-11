//
//  UserInputView.swift
//  Better
//
//  Created by Nick Ververis on 11/10/24.
//

import SwiftUI

struct UserInputView: View {
    // State variables to track if the boxes are checked
       @State private var isAnswer1Checked = false
       @State private var isAnswer2Checked = false
       @State private var isAnswer3Checked = false
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
                // Question
                           Text("What are your goals?")
                               .font(.title2)
                               .fontWeight(.bold)
                               .foregroundColor(Color("MyBlack"))
                               .padding(.bottom, 10)

                           // Answer options with checkboxes (Toggles)
                           Toggle("Become better at time management", isOn: $isAnswer1Checked)
                               .foregroundColor(Color("MyBlack"))
                               .toggleStyle(CheckboxToggleStyle())
                           
                           Toggle("Improve physical fitness", isOn: $isAnswer2Checked)
                               .toggleStyle(CheckboxToggleStyle())
                               .foregroundColor(Color("MyBlack"))
                           
                           Toggle("Enhance artistic skills", isOn: $isAnswer3Checked)
                               .foregroundColor(Color("MyBlack"))
                               .toggleStyle(CheckboxToggleStyle())
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
            }
            
        }
    }
    
}

// Checkbox Toggle Style
struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .foregroundColor(configuration.isOn ? .blue : .gray)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            configuration.label
        }
    }
}

#Preview {
    UserInputView()
}
