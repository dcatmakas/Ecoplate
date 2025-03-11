//
//  AuthViewModel.swift
//  Ecoplate
//
//  Created by Doğukan Çatmakaş on 9.03.2025.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    
    // Login Parameters
    @Published var email: String = ""
    @Published var password: String = ""
    
    // Sign Up Parameters
    @Published var signUpEmail: String = ""
    @Published var signUpPassword: String = ""
    @Published var signUpPasswordAgain: String = ""
    
    // Loading
    @Published var isLoading: Bool = false
    
    // Go ... VC
    @Published var goLoginVC: Bool = false
    @Published var goSignUpVC: Bool = false
    
    // Login Status
    @Published var isLoggedIn: Bool = false
    
    // Global State
    private let globalState: GlobalState
    
    init(globalState: GlobalState = GlobalState.shared) {
        self.globalState = globalState
        if Auth.auth().currentUser != nil {
            self.isLoggedIn = true
        } else {
            self.isLoggedIn = false
        }
    }
    
    
    // MARK: Login Function
    func login() {
        guard !email.isEmpty, !password.isEmpty else {
            globalState.alertMessage = "Email ya da şifre boş bırakılamaz."
            globalState.showAlert = true
            print("Email ya da şifre boş bırakılamaz.")
            return
        }
        
        isLoading = true
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            DispatchQueue.main.async {
                self.isLoading = false
                
                if error != nil {
                    self.globalState.alertMessage = "Kullanıcı adı ya da şifre hatalı."
                    self.globalState.showAlert = true
                    return
                }
                
                self.isLoggedIn = true
                print("Successfully logged in as \(result?.user.uid ?? "")")
            }
        }
    }
    
    // MARK: - Sign Up Function
    func signUp() {
        guard !signUpEmail.isEmpty, !signUpPassword.isEmpty, signUpPassword == signUpPasswordAgain else {
            globalState.alertMessage = "Şifrelerin eşleştiğinden ve hiçbir şeyi boş bırakmadığınızdan emin olunuz."
            globalState.showAlert = true
            print("Şifrelerin eşleştiğinden ve hiçbir şeyi boş bırakmadığınızdan emin olunuz.")
            return
        }
        
        isLoading = true
        
        Auth.auth().createUser(withEmail: signUpEmail, password: signUpPassword) { result, error in
            DispatchQueue.main.async {
                self.isLoading = false
                
                if let error = error {
                    self.globalState.alertMessage = "Kayıt olurken bir sorun oluştu."
                    self.globalState.showAlert = true
                    print("Failed to sign up: \(error.localizedDescription)")
                    return
                }
                
                if let user = result?.user {
                    self.saveUserToFirestore(user: user)
                }
            }
        }
    }
    
    // MARK: - Save User
    private func saveUserToFirestore(user: User) {
        let db = Firestore.firestore()
        let userEmail = user.email ?? ""
        let userId = user.uid
        
        let authData: [String: Any] = [
            "is_user": true
        ]
        
        db.collection("auth")
            .document(userEmail)
            .setData(authData) { error in
                if let error = error {
                    self.globalState.alertMessage = "Kullanıcı bilgileri kaydedilirken hata oluştu: \(error.localizedDescription)"
                    self.globalState.showAlert = true
                    print("Error saving user to Firestore (auth): \(error.localizedDescription)")
                } else {
                    print("User saved to Firestore (auth) with email: \(userEmail)")
                }
            }
        
        let userData: [String: Any] = [
            "mail_address": userEmail
        ]
        
        db.collection("users")
            .document(userId)
            .setData(userData) { error in
                if let error = error {
                    self.globalState.alertMessage = "Kullanıcı bilgileri kaydedilirken hata oluştu: \(error.localizedDescription)"
                    self.globalState.showAlert = true
                    print("Error saving user to Firestore (users): \(error.localizedDescription)")
                } else {
                    self.isLoggedIn = true
                    print("User saved to Firestore (users) with id: \(userId)")
                }
            }
    }
    
    // MARK: Logout
    func logout() {
        do {
            try Auth.auth().signOut()
            isLoggedIn = false
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}
