import SwiftUI

struct RequestHelpView: View {
    var body: some View {
        VStack(spacing: 30) {
            // Title
            Text("Request Assistance")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top, 40)
                .accessibilityLabel("Request Assistance") // Accessibility Label for Title
                .accessibilityHint("This is the page where you can request help.") // Accessibility Hint for Title
            
            // Description
            Text("Connect with a volunteer for help via video call.")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .accessibilityLabel("Connect with a volunteer for help via video call.") // Accessibility Label for Description
                .accessibilityHint("This text explains the functionality of the page.") // Hint to describe the page
            
            // Image Placeholder
            Image(systemName: "video.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.blue)
                .padding(20)
                .accessibilityLabel("Video Call Icon") // Accessibility Label for Image
                .accessibilityHint("Tap to start a video call") // Accessibility Hint for Image
                .accessibilityAddTraits(.isButton) // Mark the image as a clickable button for VoiceOver users
            
            Spacer()

            // Action Button
            Button(action: {
                // Placeholder action for starting a video call
                print("Start Video Call")
            }) {
                Text("Start Video Call")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 40)
            .accessibilityLabel("Start Video Call Button") // Accessibility Label for Button
            .accessibilityHint("Tap to initiate a video call with a volunteer.") // Accessibility Hint for Button
            .accessibilityAddTraits(.isButton) // Mark the button as clickable for VoiceOver users

            Spacer()
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue.opacity(0.2)]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(30)
        .shadow(radius: 5)
        .padding(.horizontal)
        .accessibilityElement(children: .ignore) // Grouping all elements as one accessibility element
    }
}

struct RequestHelpView_Previews: PreviewProvider {
    static var previews: some View {
        RequestHelpView()
            .previewDevice("iPhone 13")
    }
}
