import SwiftUI
import Firebase

struct ContentView: View {
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                Text("Be My Eyes")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .accessibilityLabel("Be My Eyes App Title")
                    .accessibilityHint("This is the title of the app.")

                Spacer()
//                userViewModel.isAuthenticated = true

//                if userViewModel.isAuthenticated {a
                if true {
                    // If the user is authenticated, show the main options
                    VStack(spacing: 20) {
                        NavigationLink(destination: RequestHelpView()) {
                            Text("Request Assistance")
                                .font(.title2)
                                .foregroundColor(.white)
                                .frame(maxWidth: 300) // Set consistent width
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(15)
                                .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 5)
                                .accessibilityLabel("Request Assistance Button")
                                .accessibilityHint("Tap to request assistance from a volunteer.")
                        }

                        NavigationLink(destination: ProvideHelpView()) {
                            Text("Provide Assistance")
                                .font(.title2)
                                .foregroundColor(.white)
                                .frame(maxWidth: 300) // Set consistent width
                                .padding()
                                .background(Color.green)
                                .cornerRadius(15)
                                .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 5)
                                .accessibilityLabel("Provide Assistance Button")
                                .accessibilityHint("Tap to volunteer and provide assistance.")
                        }

                        // Logout Button
                        Button(action: handleLogout) {
                            Text("Logout")
                                .font(.title2)
                                .foregroundColor(.white)
                                .frame(maxWidth: 300)
                                .padding()
                                .background(Color.red)
                                .cornerRadius(15)
                                .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 5)
                        }
                    }
                } else {
                    // If the user is not authenticated, show the login/signup options
                    VStack(spacing: 20) {
                        NavigationLink(destination: LoginView()) {
                            Text("Login")
                                .font(.title2)
                                .foregroundColor(.white)
                                .frame(maxWidth: 300) // Set consistent width
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(15)
                                .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 5)
                        }

                        NavigationLink(destination: SignupView()) {
                            Text("Signup")
                                .font(.title2)
                                .foregroundColor(.white)
                                .frame(maxWidth: 300) // Set consistent width
                                .padding()
                                .background(Color.green)
                                .cornerRadius(15)
                                .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 5)
                        }
                    }
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Home")
        }
    }

    // Logout handler
    private func handleLogout() {
        print("Loggingout")
        userViewModel.logout()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserViewModel())  // Inject UserViewModel for preview
            .previewDevice("iPhone 13")
    }
}
