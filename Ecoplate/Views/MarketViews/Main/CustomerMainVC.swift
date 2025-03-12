//
//  CustomerMainVC.swift
//  Ecoplate
//
//  Created by Doğukan Çatmakaş on 12.03.2025.
//

import SwiftUI

struct CustomerMainVC: View {
    
    // Selected Index
    @State var selectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedIndex) {
                    MyMarketVC()
                        .tag(0)
                    MyMarketProfileVC()
                        .tag(1)
                }
                .tabViewStyle(DefaultTabViewStyle())
            }
            
            // TabBar
            MarketCustomTabBarView(selectedIndex: $selectedIndex)
        }
    }
}

#Preview {
    CustomerMainVC()
}
