//
//  GlobalState.swift
//  Cibusy
//
//  Created by Doğukan Çatmakaş on 4.12.2024.
//

import Foundation
import SwiftUI

final class GlobalState: ObservableObject {
    
    // Shared
    static let shared = GlobalState()
    
    // Alert
    @Published var showAlert: Bool = false
    @Published var alertTitle: String = "Hata"
    @Published var alertMessage: String = ""
    
    // Toast
    @Published var toastImage: Image? = nil
    @Published var toastMessage: String = ""
    @Published var showToast: Bool = false
    
    private init() {}
    
    /// Show Global Alert View
    func showGlobalAlert(title: String = "Hata!", message: String) {
        alertTitle = title
        alertMessage = message
        showAlert = true
    }
    
    /// Show Global Toast View
    func showGlobalToast(image: Image?, message: String) {
        toastImage = image
        toastMessage = message
        showToast = true
    }
}
