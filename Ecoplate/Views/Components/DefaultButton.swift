//
//  DefaultButton.swift
//  Cibusy
//
//  Created by Doğukan Çatmakaş on 25.04.2024.
//

import SwiftUI

struct DefaultButton: View {
    
    // Button Text
    @State var buttonText: String
    
    // Button Color
    @State var buttonColor: Color
    @State var buttonTextColor: Color
    
    // Button Action
    var buttonAction: () -> ()
    
    var body: some View {
        
        Button {
            hideKeyboard()
            buttonAction()
        } label: {
            // Button Design
            ZStack {
                Rectangle()
                    .frame(width: .infinity, height: 50)
                    .foregroundColor(buttonColor)
                    .cornerRadius(16)
                    
                Text(buttonText)
                    .foregroundColor(buttonTextColor)
                    .fontWeight(.semibold)
                    .font(Font.system(size: 16))
            }
        }
        .padding(.horizontal)
        
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
