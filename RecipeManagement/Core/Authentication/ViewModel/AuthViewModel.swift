import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var user: User?
    
    init() {
        if let firebaseUser = Auth.auth().currentUser {
            self.user = User(id: firebaseUser.uid, fullName: firebaseUser.displayName ?? "", email: firebaseUser.email ?? "")
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
            let firebaseUser = authResult.user
            self.user = User(id: firebaseUser.uid, fullName: firebaseUser.displayName ?? "", email: firebaseUser.email ?? "")
        } catch {
            print("Error: \(error.localizedDescription)")
            throw error
        }
    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
            let firebaseUser = authResult.user
            let changeRequest = firebaseUser.createProfileChangeRequest()
            changeRequest.displayName = fullname
            try await changeRequest.commitChanges()
            self.user = User(id: firebaseUser.uid, fullName: fullname, email: email)
        } catch {
            print("Error: \(error.localizedDescription)")
            throw error
        }
    }
    
    func signOut() throws {
        do {
            try Auth.auth().signOut()
            self.user = nil
        } catch {
            print("Error: \(error.localizedDescription)")
            throw error
        }
    }
}
