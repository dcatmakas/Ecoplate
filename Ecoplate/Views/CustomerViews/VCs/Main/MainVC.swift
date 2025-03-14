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
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedIndex) {
                    MarketVC()
                        .tag(0)
                    ExploreVC()
                        .tag(1)
                    CartVC()
                        .tag(2)
                    FavoritesVC()
                        .tag(3)
                    ProfileVC()
                        .tag(4)
                }
                .tabViewStyle(DefaultTabViewStyle())
            }
            
            // TabBar
            CustomTabBarView(selectedIndex: $selectedIndex)
        }
    }
}

#Preview {
    MainVC()
}
