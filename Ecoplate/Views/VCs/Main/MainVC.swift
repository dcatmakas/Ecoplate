//
//  MainVC.swift
//  Ecoplate
//
//  Created by Doğukan Çatmakaş on 9.03.2025.
//

import SwiftUI

struct MainVC: View {
    
    // Selected Index
    @State var selectedIndex: Int = 0
    
    // Show Sign Up
    @State private var showCompleteProfileVC: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedIndex) {
                    MarketVC()
                        .tag(0)
                    ExploreVC()
                        .tag(1)
                    CartVC()
                        .tag(3)
                    FavoritesVC()
                        .tag(4)
                    ProfileVC()
                        .tag(5)
                }
                .tabViewStyle(DefaultTabViewStyle())
            }
            
            // TabBar
            CustomTabBarView(selectedIndex: $selectedIndex, showCompleteProfileVC: $showCompleteProfileVC)
        }
    }
}

#Preview {
    MainVC()
}
