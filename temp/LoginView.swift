import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @EnvironmentObject var userViewModel: UserViewModel // Integrate the view model
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""

    var body: some View {
        VStack(spacing: 30) {
            Text("Log In")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 40)
                .accessibilityLabel("Log In Screen")

            VStack(spacing: 20) {
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .accessibilityLabel("Email input field")
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .accessibilityLabel("Password input field")
            }
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }

            Button(action: handleLogin) {
                Text("Log In")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding(.horizontal, 40)
            .accessibilityLabel("Log in button")
            .accessibilityHint("Logs in with the provided email and password")

            Spacer()
        }
        .padding()
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue.opacity(0.2)]),
                           startPoint: .top,
                           endPoint: .bottom)
        )
        .navigationTitle("Log In")
    }

    private func handleLogin() {
        userViewModel.login(email: email, password: password) { error in
            if let error = error {
                errorMessage = error
            } else {
                errorMessage = ""
                print("Login successful!")
                // Navigate to home or update app state
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(UserViewModel()) // Provide the view model for preview
            .previewDevice("iPhone 13")
    }
}
