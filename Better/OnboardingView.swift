import SwiftUI

struct OnboardingView: View {
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
            
            ScrollView {
                VStack {
                    // Your scrollable content
                    Text("""
                        Here in Better, we believe that the most valuable resource we have is time. How we choose to spend our time shapes our skills, strengths, ideas and capabilities.
                        
                        Most of us have it better in one area and we’re struggling in another. Ultimately, how we separate our days, hours, minutes creates the spectrum of our skillset.

                        Some of us may need to be better professionals, better artists, better athletes, better friends and partners or a combination of all of the above. Let’s explore together through a series of questions, how much time is available on each one of your days, what are your targets and what we can achieve with it.
                        
                        Through the advice of experts in each field, we will set what your current level is and create step to step time framed guidelines to advance on your chosen areas.

                        On each one of your chosen target areas, we will set realistic milestones, end targets and steps to achieve them.

                        In the end, you will have a complete timeline for your next weeks, months etc.
                        """)
                    .foregroundColor(Color("MyBlack"))
                    .padding(.top, 90)
                    .padding(.horizontal, 20)
                }
            }

            // Anchored logo at the top
            VStack {
                ZStack {
                    Rectangle()
                        .stroke(Color("MyBlack"), lineWidth: /*@START_MENU_TOKEN@*/4.0/*@END_MENU_TOKEN@*/)
                        .fill(Color("MyWhite"))
                        .frame(width: .infinity, height: 120)
                        .ignoresSafeArea()
                        .padding(.bottom, 95)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("MyWhite"))
                        .stroke(Color("MyBlack"), lineWidth:2)
                        .shadow(color: Color("MyBlack").opacity(0.5), radius: 10, x: 5, y: 5)
                        .frame(width: 30, height: 30)
                        .padding(.bottom, 150) // Adjust top padding to anchor the logo near the top
                    
                    Text("B")
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                        .foregroundColor(Color("MyBlack"))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 150) // Adjust top padding to anchor the logo near the top
                }
            }
            .frame(maxWidth: .infinity, alignment: .top) // Align logo to the top
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    OnboardingView()
}
