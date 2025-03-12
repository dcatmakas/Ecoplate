//
//  CustomTabBarView.swift
//  Cibusy
//
//  Created by Doğukan Çatmakaş on 18.05.2024.
//

import SwiftUI

struct CustomTabBarView: View {
    
    // Keyboard Height Helper
    @ObservedObject private var keyboardHeightHelper = KeyboardHeightHelper()
    
    // Selected Index
    @Binding var selectedIndex: Int
    
    // Tab Bar Images
    var imageNames: [String] = ["storefront", "magnifyingglass.circle", "basket", "heart", "person"]
    var buttonNames: [String] = ["Mağaza", "Keşfet", "Sepet", "Favoriler", "Hesap"]
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                Divider()
                
                HStack {
                    ForEach(imageNames.indices, id: \.self) { index in
                        Spacer()
                        
                        let image = imageNames[index]
                        let name = buttonNames[index]
                        
                        VStack {
                            Image(systemName: selectedIndex == index ? "\(image).fill" : image)
                                .font(Font.system(size: 24))
                                .foregroundColor(selectedIndex == index ? .primaryA : .black)
                                .padding(.vertical, 8)
                                .onTapGesture {
                                    withAnimation {
                                        selectedIndex = index
                                    }
                                }
                            
                            Text(name)
                                .font(.caption2)
                                .foregroundColor(selectedIndex == index ? .primaryA : .black)
                        }
                        
                        Spacer()
                    }
                }
                .padding(.horizontal)
            }
            .background(.white)
        }
        .padding(.bottom, -keyboardHeightHelper.keyboardHeight)
        .animation(.easeOut(duration: 0.16), value: keyboardHeightHelper.keyboardHeight)
    }
}

#Preview {
    CustomTabBarView(selectedIndex: .constant(0))
}

struct MarketCustomTabBarView: View {
    
    // Keyboard Height Helper
    @ObservedObject private var keyboardHeightHelper = KeyboardHeightHelper()
    
    // Selected Index
    @Binding var selectedIndex: Int
    
    // Tab Bar Images
    var imageNames: [String] = ["storefront", "person"]
    var buttonNames: [String] = ["Mağazam", "Hesap"]
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                Divider()
                
                HStack {
                    ForEach(imageNames.indices, id: \.self) { index in
                        Spacer()
                        
                        let image = imageNames[index]
                        let name = buttonNames[index]
                        
                        VStack {
                            Image(systemName: selectedIndex == index ? "\(image).fill" : image)
                                .font(Font.system(size: 24))
                                .foregroundColor(selectedIndex == index ? .primaryA : .black)
                                .padding(.vertical, 8)
                                .onTapGesture {
                                    withAnimation {
                                        selectedIndex = index
                                    }
                                }
                            
                            Text(name)
                                .font(.caption2)
                                .foregroundColor(selectedIndex == index ? .primaryA : .black)
                        }
                        
                        Spacer()
                    }
                }
                .padding(.horizontal)
            }
            .background(.white)
        }
        .padding(.bottom, -keyboardHeightHelper.keyboardHeight)
        .animation(.easeOut(duration: 0.16), value: keyboardHeightHelper.keyboardHeight)
    }
}
