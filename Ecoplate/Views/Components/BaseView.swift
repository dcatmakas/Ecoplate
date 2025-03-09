//
//  BaseView.swift
//  Cibusy
//
//  Created by Doğukan Çatmakaş on 5.05.2024.
//

import SwiftUI

struct BaseView<Content: View>: View {
    
    // Content
    let content: Content
    
    // Loading
    @Binding var isLoading: Bool
    
    // Global State
    @EnvironmentObject var globalState: GlobalState

    init(isLoading: Binding<Bool> = .constant(false),
         @ViewBuilder content: () -> Content) {
        self._isLoading = isLoading
        self.content = content()
    }

    var body: some View {
        ZStack {
            content
            
            if isLoading {
                LoadingView()
                    .animation(.default, value: isLoading)
            }
            
            if globalState.showAlert {
                AlertView(title: globalState.alertTitle, message: globalState.alertMessage, showAlert: $globalState.showAlert)
                    .animation(.default, value: globalState.showAlert)
            }
            
            if globalState.showToast {
                ToastView(image: globalState.toastImage, message: globalState.toastMessage, showToastView: $globalState.showToast)
                    .animation(.default, value: globalState.showToast)
            }
        }
        .background(.white)
        .environment(\.colorScheme, .light)
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        .contentShape(Rectangle())
    }
}
