//
//  AuthViewModel.swift
//  Ecoplate
//
//  Created by Doğukan Çatmakaş on 9.03.2025.
//

import SwiftUI
import FirebaseAuth

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
    
    
    // Login Function
    func login() {
        guard !email.isEmpty, !password.isEmpty else {
            print("Email and password should not be empty.")
            return
        }
        
        isLoading = true
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            DispatchQueue.main.async {
                self.isLoading = false
                
                if let error = error {
                    print("Failed to login: \(error.localizedDescription)")
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
            print("Make sure passwords match and fields are not empty.")
            return
        }
        
        isLoading = true
        
        Auth.auth().createUser(withEmail: signUpEmail, password: signUpPassword) { result, error in
            DispatchQueue.main.async {
                self.isLoading = false
                
                if let error = error {
                    print("Failed to sign up: \(error.localizedDescription)")
                    return
                }
                
                self.isLoggedIn = true
                print("Successfully signed up as \(result?.user.uid ?? "")")
            }
        }
    }
}
