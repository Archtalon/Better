import SwiftUI

struct UserInputView: View {
    @State private var currentQuestion = "What are your current goals?"
    @State private var possibleAnswers = ["Improve physical performance.", "Improve in a field of study.", "Improve in both.", "I don't really know."]
    
    @State private var selectedAnswer: Int? = nil // Track the selected answer for flashing effect
    @State private var flashRectangle: Bool = false // Control flashing effect

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
                    .fontWeight(.bold)
                    .foregroundColor(Color("MyBlack"))
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
                                        .fontWeight(.bold)
                                        .foregroundColor(colorForButton(index: index)) // Text color based on index
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color("MyWhite")) // Fixed background color
                                        .cornerRadius(10)
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
                                    logoRectangle(backgroundColor: Color("MyWhite"), logoColor: .red, logoName: "figure.run", flashing: selectedAnswer == 0)
                                    // Top right: studying logo
                                    logoRectangle(backgroundColor: Color("MyWhite"), logoColor: .green, logoName: "book", flashing: selectedAnswer == 1)
                                }
                                HStack(spacing: 0) {
                                    // Bottom left: combination logo
                                    logoRectangle(backgroundColor: Color("MyWhite"), logoColor: .orange, logoName: "wand.and.stars", flashing: selectedAnswer == 2)
                                    // Bottom right: question mark logo
                                    logoRectangle(backgroundColor: Color("MyWhite"), logoColor: .brown, logoName: "questionmark", flashing: selectedAnswer == 3)
                                }
                            }
                        }
                    )
                
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .padding()
        }
    }

    // Function to handle answer selection and trigger flashing
    func handleAnswerSelection(index: Int) {
        selectedAnswer = index
        flashRectangle = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            flashRectangle = false
        }
        // Handle question and answers logic here...
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

    // Rectangle with flashing effect for logos
    func logoRectangle(backgroundColor: Color, logoColor: Color, logoName: String, flashing: Bool) -> some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(backgroundColor) // Always MyWhite for background
            .overlay(
                Image(systemName: logoName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(30)
                    .foregroundColor(flashing ? logoColor.opacity(0.5) : logoColor) // Flash effect on logo color
            )
            .padding(5)
            .frame(height: 100) // Adjust to fit the layout
    }
}

#Preview {
    UserInputView()
}
