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
       @State private var isAnswer4Checked = false
       @State private var isAnswer5Checked = false
       @State private var isAnswer6Checked = false
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
                ZStack {
                    Rectangle()
                        .stroke(Color("MyBlack"), lineWidth: 2)
                        .fill(Color("MyWhite"))
                        .shadow(color: Color("MyBlack").opacity(0.5), radius: 10, x: 5, y: 5)
                        .frame(width: 350, height: 200)
                   
                    VStack {
                        Text("What are your goals?")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color("MyBlack"))
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 10)
                        // Answer options with checkboxes (Toggles)
                        Toggle("Become better at time management", isOn: $isAnswer1Checked)
                            .foregroundColor(Color("MyBlack"))
                            .toggleStyle(CheckboxToggleStyle(tickColor: .green))
                        
                        Toggle("Improve physical fitness", isOn: $isAnswer2Checked)
                            .toggleStyle(CheckboxToggleStyle(tickColor: .green))
                            .foregroundColor(Color("MyBlack"))
                        
                        Toggle("Enhance artistic skills", isOn: $isAnswer3Checked)
                            .foregroundColor(Color("MyBlack"))
                            .toggleStyle(CheckboxToggleStyle(tickColor: .green))
                    }
                }
                
                ZStack {
                    Rectangle()
                        .stroke(Color("MyBlack"), lineWidth: 2)
                        .fill(Color("MyWhite"))
                        .shadow(color: Color("MyBlack").opacity(0.5), radius: 10, x: 5, y: 5)
                        .frame(width: 350, height: 200)
                   
                    VStack {
                        Text("How much time do you have?")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color("MyBlack"))
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 10)
                        // Answer options with checkboxes (Toggles)
                        Toggle("All day long", isOn: $isAnswer4Checked)
                            .foregroundColor(Color("MyBlack"))
                            .toggleStyle(CheckboxToggleStyle(tickColor: .green))
                        
                        Toggle("2-4 hours pes day", isOn: $isAnswer5Checked)
                            .toggleStyle(CheckboxToggleStyle(tickColor: .green))
                            .foregroundColor(Color("MyBlack"))
                        
                        Toggle("1 hour per day", isOn: $isAnswer6Checked)
                            .foregroundColor(Color("MyBlack"))
                            .toggleStyle(CheckboxToggleStyle(tickColor: .green))
                    }
                }
                
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
            .navigationBarBackButtonHidden(true)
            
        }
    }
    
}

// Custom Checkbox Toggle Style with customizable tick color
struct CheckboxToggleStyle: ToggleStyle {
    var tickColor: Color // Custom color for the tick

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .foregroundColor(configuration.isOn ? tickColor : .gray) // Apply custom tick color
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
