//
//  EcoplateApp.swift
//  Ecoplate
//
//  Created by Doğukan Çatmakaş on 3.03.2025.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct EcoplateApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            if authViewModel.isLoggedIn {
                MainVC()
                    .environmentObject(GlobalState.shared)
                    .environmentObject(authViewModel)
            } else {
                LoginVC()
                    .environmentObject(GlobalState.shared)
                    .environmentObject(authViewModel)
            }
        }
    }
}
