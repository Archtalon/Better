import SwiftUI

struct CalendarView: View {
    @State private var selectedDate = Date()
    
    var body: some View {

            ZStack {
                LinearGradient(
                    gradient: Gradient(stops: [
                        Gradient.Stop(color: Color("MyWhite"), location: 0.0),
                        Gradient.Stop(color: Color("MyWhite"), location: 0.5),
                        Gradient.Stop(color: Color("MyBlack"), location: 1.0)
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
                    
                    DatePicker(
                        "Select a date",
                        selection: $selectedDate,
                        displayedComponents: .date
                    )
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .accentColor(Color("MyBlack"))
                    .cornerRadius(10)
                    
                    Spacer()
                    
                    // Navigate to TimelineView when the user taps the button
                    NavigationLink(destination: TimelineView(selectedDate: selectedDate)) {
                        Text("Go to Timeline")
                            .font(.headline)
                            .padding()
                            .foregroundColor(Color("MyBlack"))
                            .frame(width: 150)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("MyBlack"), lineWidth: 2)
                                    .fill(Color("MyWhite"))
                            )
                    }
                }
                .padding()
            }
            .navigationBarBackButtonHidden(true)
        
        .colorScheme(.light)
    }
}

#Preview {
    CalendarView()
}

