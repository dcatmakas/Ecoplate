//
//  AlertView.swift
//  Cibusy
//
//  Created by Doğukan Çatmakaş on 3.05.2024.
//

import SwiftUI

struct AlertView: View {
    
    // Parameters
    @State var title: String
    @State var message: String
    
    // Show Control
    @Binding var showAlert: Bool
    
    var body: some View {
        if showAlert {
            ZStack {
                Color.gray40.opacity(0.8).ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        // Title
                        Text(title)
                            .font(.title3)
                            .bold()
                        
                        Spacer()
                        
                        // Close Button
                        Button(action: {
                            // Close Alert
                            withAnimation(.snappy) {
                                showAlert = false
                            }
                        }, label: {
                            Image(systemName: "multiply")
                                .font(.title2)
                                .foregroundColor(.gray60)
                        })
                    }
                    
                    // Message Text
                    Text(message)
                        .font(.subheadline)
                        .foregroundColor(.gray60)
                    
                    Button(action: {
                        // OK Action
                        withAnimation {
                            showAlert = false
                        }
                    }, label: {
                        Text("Tamam")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.primaryA)
                            .cornerRadius(16, corners: .allCorners)
                    })
                    .padding(.top, 10)
                    
                }
                .padding()
                .background(.white)
                .cornerRadius(16, corners: .allCorners)
                .overlay(RoundedRectangle(cornerRadius: 16)
                    .stroke(.gray40, lineWidth: 1)
                )
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    AlertView(title: "Hata", message: "Bu mail adresi kullanılmaktadır. Lütfen farklı bir mail adresi ile tekrar deneyiniz.", showAlert: .constant(true))
}

struct CustomAlert {
    let title: String
    let message: String
}
