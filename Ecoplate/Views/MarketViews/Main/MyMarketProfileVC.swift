//
//  MyMarketProfileVC.swift
//  Ecoplate
//
//  Created by Doğukan Çatmakaş on 12.03.2025.
//

import SwiftUI

struct MyMarketProfileVC: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        BaseView(isLoading: $authViewModel.isLoading) {
            VStack {
                Button {
                    authViewModel.logout()
                } label: {
                    Text("Çıkış yap")
                        .foregroundColor(.red)
                }
                
            }
        }
    }
}

#Preview {
    MyMarketProfileVC()
}
