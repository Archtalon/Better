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
            
            // HStack to hold sliders and the center line
            HStack(alignment: .bottom) {
                // Start Time Slider (Vertical)
                VStack {
                    Text("From")
                        .font(.footnote)
                        .foregroundColor(.gray)

                    Slider(
                        value: $startHour,
                        in: 0...23,
                        step: 1,
                        onEditingChanged: { _ in
                            if startHour > endHour {
                                endHour = startHour
                            }
                        }
                    )
                    .rotationEffect(.degrees(-90)) // Rotate slider to vertical
                    .frame(height: 300) // Adjust the height for a larger range
                    .padding(.horizontal)
                    
                    Text(formatHour(startHour))
                        .font(.caption)
                        .padding(.top, 8)
                }
                
                // Center Line with Hour Labels
                VStack {
                    ForEach(0..<24, id: \.self) { hour in
                        if hour % 3 == 0 {  // Show hour labels at every 3-hour interval
                            HStack {
                                Text("\(hour):00")
                                    .font(.footnote)
                                    .frame(width: 50, alignment: .trailing) // Align text to the right
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                        } else {
                            Spacer()
                        }
                    }
                }
                .frame(width: 60)  // Width for the center line
                .overlay(
                    Rectangle()
                        .frame(width: 2) // Width of the line
                        .foregroundColor(.gray)
                )
                
                // End Time Slider (Vertical)
                VStack {
                    Text("To")
                        .font(.footnote)
                        .foregroundColor(.gray)

                    Slider(
                        value: $endHour,
                        in: 0...23,
                        step: 1,
                        onEditingChanged: { _ in
                            if endHour < startHour {
                                startHour = endHour
                            }
                        }
                    )
                    .rotationEffect(.degrees(-90)) // Rotate slider to vertical
                    .frame(height: 300) // Adjust the height for a larger range
                    .padding(.horizontal)
                    
                    Text(formatHour(endHour))
                        .font(.caption)
                        .padding(.top, 8)
                }
            }
            .padding(.bottom, 20)
            
            Spacer()
            
            Button(action: {
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
