import SwiftUI
import FirebaseAuth

class UserViewModel: ObservableObject {
    @Published var isAuthenticated: Bool = false
    @Published var currentUserEmail: String? = nil
    @Published var authError: String? = nil

    init() {
        checkAuthentication()
    }

    private func checkAuthentication() {
        if let currentUser = Auth.auth().currentUser {
            self.isAuthenticated = true
            self.currentUserEmail = currentUser.email
        } else {
            self.isAuthenticated = false
            self.currentUserEmail = nil
        }
    }

    func login(email: String, password: String, completion: @escaping (String?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.authError = error.localizedDescription
                    completion(error.localizedDescription)
                } else {
                    self?.isAuthenticated = true
                    self?.currentUserEmail = result?.user.email
                    self?.authError = nil
                    completion(nil)
                }
            }
        }
    }

    func signup(email: String, password: String, completion: @escaping (String?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.authError = error.localizedDescription
                    completion(error.localizedDescription)
                } else {
                    self?.isAuthenticated = true
                    self?.currentUserEmail = result?.user.email
                    self?.authError = nil
                    completion(nil)
                }
            }
        }
    }

    func logout() {
        do {
            try Auth.auth().signOut()
            isAuthenticated = false
            currentUserEmail = nil
            authError = nil
        } catch {
            print("Error signing out: \(error.localizedDescription)")
            authError = error.localizedDescription
        }
    }
}
