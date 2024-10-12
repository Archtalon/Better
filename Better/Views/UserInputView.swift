import SwiftUI

struct UserInputView: View {
    @State private var currentQuestion = "What are your current goals?"
    @State private var possibleAnswers = ["Improve pshysically.", "Improve mentally.", "I don't really know."]
    
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
            
            TopBarView()
            VStack {
                Spacer()
                Spacer()
                Spacer()
                // Display the current question
                Text(currentQuestion)
                    .fontWeight(.bold)
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color("MyBlack")/*@END_MENU_TOKEN@*/)
                    .padding()
                
                
                // Display possible answers inside a RoundedRectangle
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 200)
                    .overlay(
                        VStack {
                            Button(action: {
                                handleAnswerSelection(answer: "A")
                            }) {
                                Text(possibleAnswers[0])
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.myBlack)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.myWhite)
                                    .cornerRadius(10)
                            }
                            .padding(.horizontal)
                            
                            Button(action: {
                                handleAnswerSelection(answer: "B")
                            }) {
                                Text(possibleAnswers[1])
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.myBlack)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.myWhite)
                                    .cornerRadius(10)
                            }
                            .padding(.horizontal)
                            
                            Button(action: {
                                handleAnswerSelection(answer: "C")
                            }) {
                                Text(possibleAnswers[2])
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.myBlack)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.myWhite)
                                    .cornerRadius(10)
                            }
                            .padding(.horizontal)
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
            .navigationTitle("Questionnaire")
        }
    }
    
    // Function to handle answer selection and update the next question
    func handleAnswerSelection(answer: String) {
        switch currentQuestion {
        case "What are your current goals?":
            if answer == "A" {
                currentQuestion = "Why do you like Red?"
                possibleAnswers = ["It's vibrant", "It's bold", "It's warm"]
            } else if answer == "B" {
                currentQuestion = "Why do you like Green?"
                possibleAnswers = ["It's calming", "It's fresh", "It's natural"]
            } else {
                currentQuestion = "Why do you like Blue?"
                possibleAnswers = ["It's peaceful", "It's cool", "It's relaxing"]
            }
            
        case "Why do you like Red?", "Why do you like Green?", "Why do you like Blue?":
            currentQuestion = "What's your favorite season?"
            possibleAnswers = ["Spring", "Summer", "Winter"]
            
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
