//
//  ToastView.swift
//  Cibusy
//
//  Created by Doğukan Çatmakaş on 4.12.2024.
//

import SwiftUI

struct ToastView: View {
    
    // Parameters
    @State var image: Image?
    @State var message: String
    
    // Show Control
    @Binding var showToastView: Bool
    
    var body: some View {
        ZStack {
            Color.gray40.opacity(0.8).ignoresSafeArea()
                .onTapGesture {
                    showToastView = false
                }
            
            VStack(alignment: .center, spacing: 25) {
                if let image = image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .cornerRadius(12)
                }
                
                Text(message)
                    .font(.subheadline)
                    .foregroundColor(.gray70)
                    .multilineTextAlignment(.center)
                
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

#Preview {
    ToastView(image: Image(.tomato), message: "Siparişin başarıyla oluşturuldu. Şimdi sırada garsonlardan gözünü ayırmamak var. 👀", showToastView: .constant(true))
}
