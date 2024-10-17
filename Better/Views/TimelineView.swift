import SwiftUI

struct TimelineView: View {
    var selectedDate: Date
    @State private var startY: CGFloat = 0
    @State private var endY: CGFloat = 100
    @State private var selectedStartHour = 0
    @State private var selectedEndHour = 1
    
    let hoursInDay = 24
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Timeline for \(formattedDate(selectedDate))")
                    .font(.largeTitle)
                    .padding()
                
                ZStack {
                    // The vertical timeline line
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 4)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                        .padding(.horizontal)
                    
                    // Time slots along the line
                    VStack {
                        ForEach(0..<hoursInDay, id: \.self) { hour in
                            Text("\(hour):00")
                                .frame(height: geometry.size.height / CGFloat(hoursInDay))
                        }
                    }
                    .position(x: geometry.size.width / 2 - 30, y: geometry.size.height / 2)
                    
                    // Draggable selection overlay
                    Rectangle()
                        .fill(Color.blue.opacity(0.3))
                        .frame(width: geometry.size.width, height: endY - startY)
                        .position(x: geometry.size.width / 2, y: (startY + endY) / 2)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { value in
                                    let dragPosition = value.location.y
                                    
                                    // Ensure the drag stays within the bounds of the screen
                                    let minY: CGFloat = 0
                                    let maxY: CGFloat = geometry.size.height
                                    
                                    if dragPosition < startY {
                                        startY = max(minY, dragPosition)
                                    } else {
                                        endY = min(maxY, dragPosition)
                                    }
                                    
                                    // Update selected hours based on drag position
                                    selectedStartHour = Int((startY / maxY) * CGFloat(hoursInDay))
                                    selectedEndHour = Int((endY / maxY) * CGFloat(hoursInDay))
                                }
                        )
                }
                
                Spacer()
                
                Text("Selected time: \(selectedStartHour):00 to \(selectedEndHour):00")
                    .font(.headline)
                
                Button(action: {
                    // Handle time selection confirmation
                    print("Selected time range: \(selectedStartHour):00 to \(selectedEndHour):00")
                }) {
                    Text("Confirm")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(8)
                }
                .padding()
            }
        }
    }
    
    // Helper function to format the selected date
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}
