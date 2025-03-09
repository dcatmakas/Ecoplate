//
//  ProfileVC.swift
//  Ecoplate
//
//  Created by Doğukan Çatmakaş on 9.03.2025.
//

import SwiftUI

struct ProfileVC: View {
    
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
    ProfileVC()
}
