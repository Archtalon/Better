import SwiftUI

struct BasicInputView: View {
    @State private var currentQuestion = "What are your current goals?"
    @State private var possibleAnswers = ["Improve physical performance.", "Improve in a field of study.", "Improve in both.", "I don't really know."]
    
    @State private var selectedAnswer: Int? = nil // Track the selected answer
    @State private var flashRectangle: Bool = false // Control flashing effect
    @State private var flashNextButton: Bool = false // Control flashing effect for Next button
    @State private var nextButtonBorderColor: Color = Color("MyBlack") // Border color for Next button

    var body: some View {
        ZStack(alignment: .top) {
            LinearGradient(
                gradient: Gradient(stops: [
                    Gradient.Stop(color: Color("MyWhite"), location: 0.0),   // Start color
                    Gradient.Stop(color: Color("MyWhite"), location: 0.5),  // Middle color stop
                    Gradient.Stop(color: Color("MyBlack"), location: 1.0)  // End color
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            TopBarView()

            VStack {
                Spacer()
                Spacer()
                Spacer()

                // Display the current question
                Text(currentQuestion)
                    .font(.largeTitle)
                    //.fontWeight(.bold)
                    .foregroundColor(Color("MyBlack")) // Default text color MyBlack
                    .padding()

                // Display possible answers inside a RoundedRectangle
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 250)
                    .overlay(
                        VStack {
                            ForEach(0..<possibleAnswers.count, id: \.self) { index in
                                Button(action: {
                                    handleAnswerSelection(index: index)
                                }) {
                                    Text(possibleAnswers[index])
                                        //.fontWeight(.bold)
                                        .foregroundColor(selectedAnswer == index ? colorForButton(index: index) : Color("MyBlack")) // Set color after selection
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color("MyWhite")) // Fixed background color
                                        .cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(selectedAnswer == index ? colorForButton(index: index) : Color.clear, lineWidth: 2)
                                        ) // Border flash effect
                                }
                                .padding(.horizontal)
                            }
                        }
                        .padding()
                    )

                // Outer Rectangle for the logos
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 200)
                    .overlay(
                        GeometryReader { geo in
                            VStack(spacing: 0) {
                                HStack(spacing: 0) {
                                    // Top left: physical performance logo
                                    logoRectangle(backgroundColor: Color("MyWhite"), logoColor: colorForLogo(index: 0), logoName: "figure.run", flashing: selectedAnswer == 0)
                                    // Top right: studying logo
                                    logoRectangle(backgroundColor: Color("MyWhite"), logoColor: colorForLogo(index: 1), logoName: "book", flashing: selectedAnswer == 1)
                                }
                                HStack(spacing: 0) {
                                    // Bottom left: combination logo
                                    logoRectangle(backgroundColor: Color("MyWhite"), logoColor: colorForLogo(index: 2), logoName: "wand.and.stars", flashing: selectedAnswer == 2)
                                    // Bottom right: question mark logo
                                    logoRectangle(backgroundColor: Color("MyWhite"), logoColor: colorForLogo(index: 3), logoName: "questionmark", flashing: selectedAnswer == 3)
                                }
                            }
                        }
                    )
                
                Spacer()
                
                // Next Button
                    Button(action: {
                        flashNextButton = true
                        if let selectedIndex = selectedAnswer {
                            nextButtonBorderColor = colorForButton(index: selectedIndex) // Immediately set the border color
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            flashNextButton = false
                        }
                    }) {
                        NavigationLink(destination: TimeInputView()) {
                            Text("Next")
                                //.fontWeight(.bold)
                                .foregroundColor(selectedAnswer != nil ? colorForButton(index: selectedAnswer!) : Color("MyBlack")) // Retain color of selected answer
                                .padding(10) // Adjust padding to make the button smaller
                                .background(Color("MyWhite")) // Fixed background color
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(flashNextButton ? (selectedAnswer != nil ? colorForButton(index: selectedAnswer!) : Color.clear) : nextButtonBorderColor, lineWidth: 2)
                                ) // Border flash effect
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom) // Add bottom padding to separate from logos
            }
            .navigationBarBackButtonHidden(true)
            .padding()
        }
    }

    // Function to handle answer selection and trigger flashing
    func handleAnswerSelection(index: Int) {
        selectedAnswer = index
        flashRectangle = true
        nextButtonBorderColor = colorForButton(index: index) // Immediately set the border color
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            flashRectangle = false
            flashNextButton = true // Trigger flash for Next button as well
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                flashNextButton = false
                // Ensure border color is set to the selected answer color
                nextButtonBorderColor = colorForButton(index: index)
            }
        }
    }

    // Color function for the text in buttons
    func colorForButton(index: Int) -> Color {
        switch index {
        case 0: return .red
        case 1: return .green
        case 2: return .orange
        case 3: return .brown
        default: return .gray
        }
    }

    // Color function for logos (same logic as buttons, persist pure color after flashing)
    func colorForLogo(index: Int) -> Color {
        if flashRectangle && selectedAnswer == index {
            return colorForButton(index: index).opacity(0.5) // Flashing effect with opacity
        } else if selectedAnswer == index {
            return colorForButton(index: index) // After flash, set to full color
        } else {
            return Color("MyBlack") // Default to MyBlack
        }
    }

    // Rectangle with flashing effect for logos
    func logoRectangle(backgroundColor: Color, logoColor: Color, logoName: String, flashing: Bool) -> some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(backgroundColor) // Always MyWhite for background
            .overlay(
                Image(systemName: logoName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(30)
                    .foregroundColor(logoColor) // Flashing logo color, then persist full color
            )
            .padding(5)
            .frame(height: 100) // Adjust to fit the layout
    }
}

#Preview {
    BasicInputView()
}
