//
//  CustomTextField.swift
//  Cibusy
//
//  Created by Doğukan Çatmakaş on 25.04.2024.
//

import SwiftUI

struct CustomTextfield: View {
    
    // Parameters
    @State var imageName: String
    @State var placeholder: String
    @Binding var inputText: String
    @State var contentType: UITextContentType
    @State var keyboardType: UIKeyboardType
    
    // Controls
    @State var isPassword: Bool
    @State private var showPassword: Bool = false
    
    var body: some View {
        
        if !isPassword {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(inputText == "" ? .gray60 : .black)
                    .animation(.default, value: inputText)
                
                TextField(placeholder, text: $inputText)
                    .keyboardType(keyboardType)
                    .textContentType(contentType)
                    .padding(.leading, 4)
            }
            .padding(.horizontal)
            .padding(.vertical, 20)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.gray40, lineWidth: 1)
            )
            .padding(.horizontal)
            
        } else {
            
            if showPassword {
                // Show Password
                HStack {
                    Image(systemName: imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(inputText == "" ? .gray60 : .black)
                        .animation(.default, value: inputText)
                    
                    TextField(placeholder, text: $inputText)
                        .textContentType(contentType)
                        .keyboardType(keyboardType)
                        .padding(.leading, 4)
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            showPassword = false
                        }
                    }, label: {
                        Image(systemName: "eye.slash")
                            .foregroundColor(.gray60)
                    })
                }
                .padding(.horizontal)
                .padding(.vertical, 20)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray40, lineWidth: 1)
                )
                .padding(.horizontal)
                
            } else {
                // Hide Password
                HStack {
                    Image(systemName: imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(inputText == "" ? .gray60 : .black)
                        .animation(.default, value: inputText)
                    
                    SecureField(placeholder, text: $inputText)
                        .textContentType(contentType)
                        .keyboardType(keyboardType)
                        .padding(.leading, 4)
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            showPassword = true
                        }
                    }, label: {
                        Image(systemName: "eye")
                            .foregroundColor(.gray60)
                    })
                }
                .padding(.horizontal)
                .padding(.vertical, 20)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray40, lineWidth: 1)
                )
                .padding(.horizontal)
            }
        }
        
    }
}

#Preview {
    CustomTextfield(imageName: "lock", placeholder: "Mail adresinizi giriniz", inputText: .constant("deneme"), contentType: .password, keyboardType: .URL, isPassword: true)
}
