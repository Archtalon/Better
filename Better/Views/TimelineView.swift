import SwiftUI

struct TimelineView: View {
    var selectedDate: Date
    
    // Start and end hours for the time range (in 24-hour format)
    @State private var startHour: Double = 9.0
    @State private var endHour: Double = 17.0
    
    private let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()
    
    var body: some View {
        VStack {
            Text("Selected Date: \(selectedDate, formatter: dateFormatter)")
                .font(.title2)
                .padding()
            
            Text("Select a time range for your activity:")
                .font(.headline)
                .padding(.bottom, 20)
            
            // Display the selected time range
            HStack {
                Text("From: \(formatHour(startHour))")
                Spacer()
                Text("To: \(formatHour(endHour))")
            }
            .padding(.horizontal)
            
            // Slider for selecting start and end times
            VStack {
                Slider(
                    value: $startHour,
                    in: 0...23,
                    step: 1,
                    onEditingChanged: { _ in
                        // Ensure startHour does not exceed endHour
                        if startHour > endHour {
                            endHour = startHour
                        }
                    }
                ) {
                    Text("Start Hour")
                }
                .accentColor(.blue)
                .padding(.horizontal)
                
                Slider(
                    value: $endHour,
                    in: 0...23,
                    step: 1,
                    onEditingChanged: { _ in
                        // Ensure endHour is not less than startHour
                        if endHour < startHour {
                            startHour = endHour
                        }
                    }
                ) {
                    Text("End Hour")
                }
                .accentColor(.green)
                .padding(.horizontal)
            }
            .padding(.bottom, 20)
            
            Spacer()
            
            Button(action: {
                // Handle the action when the time range is selected
                print("Activity scheduled from \(formatHour(startHour)) to \(formatHour(endHour))")
            }) {
                Text("Confirm Activity")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.bottom)
        }
        .padding()
    }
    
    // Helper to format hours (24-hour time to AM/PM format)
    private func formatHour(_ hour: Double) -> String {
        let calendar = Calendar.current
        let date = calendar.date(bySettingHour: Int(hour), minute: 0, second: 0, of: selectedDate)!
        return timeFormatter.string(from: date)
    }
}

// Helper to format the date for display
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter
}()

#Preview {
    TimelineView(selectedDate: Date())
}
