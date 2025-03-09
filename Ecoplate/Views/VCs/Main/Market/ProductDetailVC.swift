//
//  ProductDetailVC.swift
//  Ecoplate
//
//  Created by Doğukan Çatmakaş on 9.03.2025.
//

import SwiftUI

struct ProductDetailVC: View {
    
    // Show ProductDetailVC
    @Binding var showProductDetailVC: Bool
    
    var body: some View {
        BaseView(isLoading: .constant(false)) {
            ZStack(alignment: .bottom) {
                VStack(spacing: 16) {
                    ZStack(alignment: .topLeading) {
                        Image(.tomato)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                            .padding(.bottom)
                        
                        HStack {
                            Button(action: {
                                // Back Action
                                showProductDetailVC = false
                            }, label: {
                                Image(systemName: "multiply")
                                    .font(.title2)
                                    .foregroundColor(.black)
                            })
                            
                            Spacer()
                        }
                        .padding([.horizontal, .top])
                    }
                    .padding(.top, 65)
                    .background(.gray20)
                    .cornerRadius(30, corners: [.bottomLeft, .bottomRight])
                    
                    // Product Infos
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Dolmalık Kırmızı Biber")
                                .font(.title3)
                                .bold()
                            
                            Spacer()
                            
                            Button {
                                // Favorite
                            } label: {
                                Image(systemName: "heart")
                                    .font(.title2)
                                    .foregroundColor(.red)
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            // Grammage
                            Text("1 kg fiyat")
                                .foregroundColor(.gray50)
                            
                            Text("Son Kullanma Tarihi:  ")
                                .foregroundColor(.gray50)
                            
                            + Text("09.03.2025")
                                .fontWeight(.semibold)
                        }
                        
                        HStack {
                            HStack(spacing: 16) {
                                Button {
                                    // Decrease
                                } label: {
                                    Image(systemName: "minus")
                                        .foregroundColor(.red)
                                }
                                
                                Button {
                                    // Total
                                } label: {
                                    Text("1")
                                        .padding(.horizontal)
                                        .padding(.vertical, 8)
                                        .foregroundColor(.black)
                                        .background(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(lineWidth: 1)
                                                .foregroundColor(.gray30)
                                        )
                                }
                                
                                Button {
                                    // Increase
                                } label: {
                                    Image(systemName: "plus")
                                        .foregroundColor(.primaryA)
                                }
                                
                            }
                            
                            Spacer()
                            
                            // Old Price
                            Text("₺ 19.99")
                                .font(.title2)
                                .foregroundColor(.gray50)
                                .strikethrough()
                            
                            Text("₺ 9.99")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primaryA)
                        }
                        .padding(.vertical)
                        
                        Divider()
                        
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Ürün Detayları")
                                .font(.headline)
                            
                            Text("09.03.2025 tarihine kadar tüketilmesi ve buzdolabında saklanması tavsiye edilir.")
                                .font(.subheadline)
                                .fontWeight(.light)
                                .foregroundColor(.gray60)
                        }
                        .padding(.vertical)
                        
                        Divider()
                        
                        HStack {
                            Text("Değerlendirme")
                                .font(.headline)
                            
                            Spacer()
                            
                            HStack(spacing: 3) {
                                ForEach(0..<5) { _ in
                                    Image(systemName: "star.fill")
                                        .font(.subheadline)
                                        .foregroundColor(.primaryA)
                                }
                            }
                        }
                        .padding(.vertical)
                        
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                }
                .ignoresSafeArea()
                
                DefaultButton(buttonText: "Sepete Ekle", buttonColor: .primaryA, buttonTextColor: .white) {
                    // Add to Cart
                }
                .padding(.bottom)
            }
        }
    }
}

#Preview {
    ProductDetailVC(showProductDetailVC: .constant(false))
}
