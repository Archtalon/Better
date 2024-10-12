import SwiftUI

struct UserInputView: View {
    @State private var currentQuestion = "What are your current goals?"
    @State private var possibleAnswers = ["Improve pshysical performance.", "Improve in a field of study.", "Improve in both.", "I don't really know."]

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
                    .frame(height: 250)  // Increased height to accommodate fourth button
                    .overlay(
                        VStack {
                            ForEach(0..<possibleAnswers.count, id: \.self) { index in
                                Button(action: {
                                    handleAnswerSelection(answer: possibleAnswers[index])
                                }) {
                                    Text(possibleAnswers[index])
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("MyBlack"))
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color("MyWhite"))
                                        .cornerRadius(10)
                                }
                                .padding(.horizontal)
                            }
                        }
                        .padding()
                    )
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .padding()
        }
    }

    // Function to handle answer selection and update the next question
    func handleAnswerSelection(answer: String) {
        switch currentQuestion {
        case "What are your current goals?":
            if answer == "A" {
                currentQuestion = "Why do you like Red?"
                possibleAnswers = ["It's vibrant", "It's bold", "It's warm", "All of the above"]
            } else if answer == "B" {
                currentQuestion = "Why do you like Green?"
                possibleAnswers = ["It's calming", "It's fresh", "It's natural", "All of the above"]
            } else {
                currentQuestion = "Why do you like Blue?"
                possibleAnswers = ["It's peaceful", "It's cool", "It's relaxing", "All of the above"]
            }
            
        case "Why do you like Red?", "Why do you like Green?", "Why do you like Blue?":
            currentQuestion = "What's your favorite season?"
            possibleAnswers = ["Spring", "Summer", "Winter", "All of the above"]
            
        case "What's your favorite season?":
            currentQuestion = "Thank you for completing the quiz!"
            possibleAnswers = []
            
        default:
            break
        }
    }
}

#Preview {
    UserInputView()
}
