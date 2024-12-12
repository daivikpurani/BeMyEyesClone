import SwiftUI

struct ProvideHelpView: View {
    var body: some View {
        VStack(spacing: 30) {
            // Title
            Text("Provide Assistance")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top, 40)
                .accessibilityLabel("Provide Assistance") // Accessibility Label for Title
                .accessibilityHint("This page allows you to provide assistance to others.") // Accessibility Hint for Title

            // Description
            Text("Offer help to a person in need via video call.")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .accessibilityLabel("Offer help to a person in need via video call.") // Accessibility Label for Description
                .accessibilityHint("This explains how you can assist someone using a video call.") // Hint to describe the page

            // Image Placeholder
            Image(systemName: "video.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.green)
                .padding(20)
                .accessibilityLabel("Video Call Icon") // Accessibility Label for Image
                .accessibilityHint("Tap to start providing assistance via video call.") // Accessibility Hint for Image
                .accessibilityAddTraits(.isButton) // Mark the image as a clickable button for VoiceOver users

            Spacer()

            // Action Button
            Button(action: {
                // Placeholder action for starting a video call to provide assistance
                print("Start Video Call to Help")
            }) {
                Text("Start Video Call")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 40)
            .accessibilityLabel("Start Video Call Button") // Accessibility Label for Button
            .accessibilityHint("Tap to initiate a video call to provide assistance.") // Accessibility Hint for Button
            .accessibilityAddTraits(.isButton) // Mark the button as clickable for VoiceOver users

            Spacer()
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.green.opacity(0.2)]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(30)
        .shadow(radius: 5)
        .padding(.horizontal)
        .accessibilityElement(children: .ignore) // Grouping all elements as one accessibility element
    }
}

struct ProvideHelpView_Previews: PreviewProvider {
    static var previews: some View {
        ProvideHelpView()
            .previewDevice("iPhone 13")
    }
}
