//
//  LoadingView.swift
//  Cibusy
//
//  Created by Doğukan Çatmakaş on 5.05.2024.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        ZStack {
            Color.gray40.opacity(0.8).ignoresSafeArea()
            
            VStack {
                ProgressView()
            }
        }
    }
}

#Preview {
    LoadingView()
}
