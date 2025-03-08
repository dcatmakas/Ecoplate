//
//  CustomSearchBar.swift
//  Cibusy
//
//  Created by Doğukan Çatmakaş on 18.05.2024.
//

import SwiftUI

struct CustomSearchBar: View {
    
    // Parameters
    @Binding var searchText: String
    @State var placeHolder: String
    
    // Cancel
    @State private var isSearching: Bool = false
    
    var body: some View {
        HStack(spacing: 12) {
            HStack(spacing: 10) {
                Image(systemName: "magnifyingglass")
                    .font(.title3)
                    .foregroundColor(.gray70)
                
                TextField(placeHolder, text: $searchText)
                    .font(Font.system(size: 14))
                    .fontWeight(.medium)
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
            .background(RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 1).foregroundColor(.gray40))
            
            .onChange(of: searchText, perform: { value in
                if value != "" {
                    withAnimation {
                        isSearching = true
                    }
                } else {
                    withAnimation {
                        isSearching = false
                    }
                }
            })
            
            if isSearching {
                Button(action: {
                    searchText = ""
                }, label: {
                    Image(systemName: "multiply.circle.fill")
                        .font(.title3)
                        .foregroundColor(.gray40)
                })
            }
        }
        .padding(.vertical, 2)
    }
}

#Preview {
    CustomSearchBar(searchText: .constant(""), placeHolder: "Mekan arayın..")
}
