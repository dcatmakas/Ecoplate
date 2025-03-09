//
//  SignUpVC.swift
//  Ecoplate
//
//  Created by Doğukan Çatmakaş on 9.03.2025.
//

import SwiftUI

struct SignUpVC: View {
    
    // View Model
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        BaseView(isLoading: $authViewModel.isLoading) {
            VStack {
                Spacer()
                
                VStack(spacing: 16) {
                    // Login Title
                    Text("Kayıt Ol")
                        .font(.title)
                        .bold()
                        .foregroundColor(.primaryA)
                    
                    Text("Ecoplate'e hoş geldin! Sağlıklı ve sürdürülebilir bir yaşam için buradayız. Sen de hemen aramıza katıl.")
                        .font(.footnote)
                        .foregroundColor(.gray50)
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal)
                
                Divider()
                    .padding()
                
                VStack(spacing: 16) {
                    // Mail Textfield
                    CustomTextfield(imageName: "envelope", placeholder: "Mail Adresi", inputText: $authViewModel.signUpEmail, contentType: .emailAddress, keyboardType: .emailAddress, isPassword: false)
                    
                    // Password Textfield
                    CustomTextfield(imageName: "lock", placeholder: "Şifre", inputText: $authViewModel.signUpPassword, contentType: .password, keyboardType: .default, isPassword: true)
                    
                    // Password Again Texrfield
                    CustomTextfield(imageName: "lock", placeholder: "Şifre Tekrar", inputText: $authViewModel.signUpPasswordAgain, contentType: .password, keyboardType: .default, isPassword: true)
                }
                
                VStack {
                    DefaultButton(buttonText: "Kayıt Ol", buttonColor: .primaryA, buttonTextColor: .white) {
                        // Sign Up Action
                        authViewModel.signUp()
                    }
                    .padding(.top)
                    
                    HStack {
                        Button {
                            // Go Login Page
                            authViewModel.goLoginVC = true
                        } label: {
                            Text("Hesabınız var mı? ")
                                .font(.subheadline)
                                .foregroundColor(.gray70)
                            + Text("Hemen Giriş Yap.")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.primaryA)
                        }
                        
                        Spacer()
                    }
                    .padding()
                }
                .padding(.top)
                
                Spacer()
                Spacer()
                
                Text("Ecoplate © 2025")
                    .font(.subheadline)
                    .foregroundColor(.gray40)
            }
            
            .fullScreenCover(isPresented: $authViewModel.goLoginVC) {
                LoginVC()
            }
        }
    }
}

#Preview {
    SignUpVC()
}
