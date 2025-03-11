//
//  MarketVC.swift
//  Ecoplate
//
//  Created by Doğukan Çatmakaş on 9.03.2025.
//

import SwiftUI

struct MarketVC: View {
    
    // Parameters
    @State private var searchText: String = ""
    
    // Is Loading
    @State private var isLoading: Bool = false
    
    // GoProductDetailVC
    @State private var goProductDetailVC: Bool = false
    
    var body: some View {
        NavigationStack {
            BaseView(isLoading: $isLoading) {
                VStack {
                    VStack(spacing: 16) {
                        Image(systemName: "carrot.fill")
                            .foregroundColor(.orange)
                        
                        HStack {
                            Image(systemName: "mappin.circle.fill")
                            
                            Text("İstanbul, Türkiye")
                        }
                        
                        // Search Bar
                        CustomSearchBar(searchText: $searchText, placeHolder: "Mağaza ya da ürün ara...")
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 25) {
                            Image(.banner)
                                .padding([.top, .horizontal])
                            
                            // Special Offer
                            VStack {
                                MarketTitleView(title: "Özel Teklif")
                                
                                // Products
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(0..<5, id: \.self) { _ in
                                            ProductCardView(productName: "Biber", productOldPrice: 10.99, productDiscountedPrice: 8.99, goProductDetailVC: $goProductDetailVC)
                                        }
                                    }
                                    .padding(.leading)
                                }
                            }
                            
                            // Best Sellers
                            VStack {
                                MarketTitleView(title: "Çok Satanlar")
                                
                                // Products
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(0..<5, id: \.self) { _ in
                                            ProductCardView(productName: "Biber", productOldPrice: 10.99, productDiscountedPrice: 8.99, goProductDetailVC: $goProductDetailVC)
                                        }
                                    }
                                    .padding(.leading)
                                }
                            }
                            
                            // Markets
                            VStack {
                                MarketTitleView(title: "Marketler")
                                
                                MarketsView()
                                    .padding(.bottom)
                                
                                // Products
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(0..<5, id: \.self) { _ in
                                            ProductCardView(productName: "Biber", productOldPrice: 10.99, productDiscountedPrice: 8.99, goProductDetailVC: $goProductDetailVC)
                                        }
                                    }
                                    .padding(.leading)
                                }
                            }
                        }
                        .padding(.bottom, 65)
                    }
                    .refreshable {
                        // Refresh
                    }
                }
            }
            .fullScreenCover(isPresented: $goProductDetailVC) {
                ProductDetailVC(showProductDetailVC: $goProductDetailVC)
            }
        }
    }
}

struct ProductCardView: View {
    
    // Parameters
    @State var productName: String
    @State var productOldPrice: Double
    @State var productDiscountedPrice: Double
    
    @Binding var goProductDetailVC: Bool
    
    var body: some View {
        VStack(spacing: 16) {
            Image(.tomato)
            
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 10) {
                    // Product Name
                    Text(productName)
                        .font(.headline)
                    
                    VStack(alignment: .leading) {
                        Text("1 kg fiyat")
                            .font(.caption)
                        
                        Text("SKT: 09.03.2025")
                            .font(.caption)
                    }
                    .foregroundColor(.gray60)
                    
                    VStack {
                        // Product Old Price
                        Text("₺ \(productOldPrice.description)")
                            .font(.subheadline)
                            .strikethrough()
                            .foregroundColor(.gray50)
                        
                        Text("₺ \(productDiscountedPrice.description)")
                            .bold()
                    }
                }
                
                Spacer()
                
                Button {
                    // Add to Cart
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .padding(8)
                        .background(
                            Rectangle()
                                .cornerRadius(6)
                                .foregroundColor(.primaryA)
                        )
                }

            }
        }
        .onTapGesture {
            goProductDetailVC = true
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(style: StrokeStyle(lineWidth: 1))
                .foregroundColor(.gray30)
        )
        .frame(maxWidth: 200)
        .padding(.trailing, 8)
    }
}

struct MarketTitleView: View {
    
    // Parameters
    @State var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
            
            Spacer()
            
            Button {
                // Show All
            } label: {
                Text("Tümünü Gör")
                    .font(.footnote)
                    .foregroundColor(.gray50)
            }
            
        }
        .padding(.horizontal)
    }
}

struct MarketsView: View {
    
    @State var images: [UIImage] = [.bakliyat, .et, .fırın, .i̇çecek, .meyve, .sebze, .pirinç, .sütÜrünleri, .yağ]
    @State var imageNames: [String] = ["Bakliyat", "Et Ürünleri", "Fırın", "İçecek", "Meyve", "Sebze", "Temel Gıda", "Süt Ürünleri", "Yağ"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<images.count, id: \.self) { index in
                    HStack(spacing: 10) {
                        Image(uiImage: images[index])
                            .resizable()
                            .frame(width: 40, height: 40)
                            .scaledToFit()
                        
                        Text(imageNames[index])
                            .font(.subheadline)
                    }
                    .padding(10)
                    .background(
                        Rectangle()
                            .cornerRadius(10)
                            .foregroundColor(.marketsBackgorund)
                    )
                }
            }
            .padding(.leading)
        }
    }
}

#Preview {
    MarketVC()
}
