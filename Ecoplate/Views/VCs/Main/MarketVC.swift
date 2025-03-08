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
    
    var body: some View {
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
                VStack(spacing: 16) {
                    Image(.banner)
                        .padding([.top, .horizontal])
                    
                    VStack(alignment: .leading) {
                        Text("Özel Teklif")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0..<5, id: \.self) { _ in
                                    ProductCardView(productName: "Biber", productOldPrice: 10.99, productDiscountedPrice: 8.99)
                                }
                            }
                            .padding(.leading)
                        }
                    }
                }
            }
        }
    }
}

struct ProductCardView: View {
    
    // Parameters
    @State var productName: String
    @State var productOldPrice: Double
    @State var productDiscountedPrice: Double
    
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

#Preview {
    MarketVC()
}
