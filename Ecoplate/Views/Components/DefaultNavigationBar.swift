//
//  DefaultNavigationBar.swift
//  Cibusy
//
//  Created by Doğukan Çatmakaş on 1.05.2024.
//

import SwiftUI

struct DefaultNavigationBar: View {
    
    // Presentation Mode
    @Environment(\.presentationMode) var presentationMode
    
    // Title
    @State var title: String?
    
    var body: some View {
        
        HStack {
            Button(action: {
                // Back Action
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "chevron.backward")
                    .font(.title2)
                    .foregroundColor(.black)
            })
            
            Spacer()
            
            Text(title ?? "")
                .font(.title3)
                .fontWeight(.semibold)
            
            Spacer()
            
            Image(systemName: "chevron.backward")
                .font(.title2)
                .opacity(0)
        }
        .padding([.horizontal, .top])
        
    }
}

#Preview {
    DefaultNavigationBar()
}
