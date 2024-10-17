import SwiftUI

struct CalendarView: View {
    @State private var selectedDate = Date()
    @State private var navigateToTimeline = false
    
    var body: some View {
        ZStack{
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
            
            
            VStack {
                
                TopBarView()
                
                Text("Select a Day")
                    .font(.largeTitle)
                    .foregroundColor(Color("MyBlack"))
                
                // Calendar for the running month
                DatePicker(
                    "Select a date",
                    selection: $selectedDate,
                    displayedComponents: .date
                )
                .datePickerStyle(GraphicalDatePickerStyle()) // Graphical calendar style
                .accentColor(Color("MyBlack"))
                .cornerRadius(10)
                
                Spacer()
                
                Button(action: {
                    navigateToTimeline = true
                }) {
                    Text("Go to Timeline")
                        .font(.headline)
                        .padding()
                        .foregroundColor(Color("MyBlack"))
                        .frame(width: 150) // Optional: Adjusts width if needed
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("MyBlack"), lineWidth: 2)
                                .fill(Color("MyWhite"))// Border color and width
                        )
                }
            }
            .padding()
        }
        .colorScheme(.light)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CalendarView()
}

