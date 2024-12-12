import SwiftUI
import FirebaseCore



@main
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

struct tempApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var userViewModel = UserViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    // Announce the app's welcome message for accessibility
                    UIAccessibility.post(notification: .announcement, argument: "Welcome to the BeMyEyes Clone. Tap anywhere to get started.")
                }.environmentObject(userViewModel)
        }
    }
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
