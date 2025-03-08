//
//  Login View.swift
//  Ecoplate
//
//  Created by Doğukan Çatmakaş on 8.03.2025.
//

import SwiftUI

struct LoginVC: View {
    
    // View Model
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                // Login Title
                Text("Giriş Yap")
                    .font(.title)
                    .bold()
                    .foregroundColor(.primaryA)
                
                Text("Ecoplate'e hoş geldin! Sağlıklı ve sürdürülebilir bir yaşam için buradayız. Sen de hemen giriş yap.")
                    .font(.footnote)
                    .foregroundColor(.gray50)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal)
            
            Divider()
                .padding()
            
            VStack(spacing: 16) {
                // Mail Textfield
                CustomTextfield(imageName: "envelope", placeholder: "Mail Adresi", inputText: $authViewModel.email, contentType: .emailAddress, keyboardType: .emailAddress, isPassword: false)
                
                // Password Textfield
                CustomTextfield(imageName: "lock", placeholder: "Şifre", inputText: $authViewModel.password, contentType: .password, keyboardType: .default, isPassword: true)
                
                HStack {
                    Spacer()
                    
                    Button {
                        // Forget Password
                    } label: {
                        Text("Şifrenizi mi unuttunuz?")
                            .font(.footnote)
                            .foregroundColor(.gray50)
                    }

                }
                .padding(.horizontal)
            }
            
            VStack {
                DefaultButton(buttonText: "Giriş Yap", buttonColor: .primaryA, buttonTextColor: .white) {
                    // Login Action
                }
                .padding(.top)
                
                HStack {
                    Button {
                        // Go Sign Up Page
                        authViewModel.goSignUpVC = true
                    } label: {
                        Text("Hesabınız yok mu? ")
                            .font(.subheadline)
                            .foregroundColor(.gray70)
                        + Text("Hemen Kayıt ol.")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primaryA)
                    }
                    
                    Spacer()
                }
                .padding()
            }
            
            Spacer()
            Spacer()
            
            Text("Ecoplate © 2025")
                .font(.subheadline)
                .foregroundColor(.gray40)
        }
        
        .fullScreenCover(isPresented: $authViewModel.goSignUpVC) {
            SignUpVC()
        }
    }
}

#Preview {
    LoginVC()
}
