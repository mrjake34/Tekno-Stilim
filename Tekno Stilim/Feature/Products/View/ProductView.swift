//
//  PokemonView.swift
//  Tekno Stilim
//
//  Created by Alkan Ataş on 9.02.2024.
//

import SwiftUI
import Kingfisher

struct ProductView: View {
    var body: some View {
        NavigationView(content: {
            VStack {
                ProductList()
            }.navigationTitle("Products")
                .navigationBarTitleDisplayMode(.inline)
        })
        
    }
}

#Preview {
    ProductView()
}

struct ProductList: View {
    @StateObject private var productViewModel: ProductViewModel = ProductViewModel(service: ProductService())
    let items = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1)
    ]
    
    private let width = (UIScreen.main.bounds.width / 2) - 16
    var body: some View {
        if ((productViewModel.data?.products?.isEmpty
            ) == false) {
            ScrollView {
                LazyVGrid(columns: items, spacing: 8) {
                    ForEach(productViewModel.data?.products ?? []) {
                        product in
                        NavigationLink(
                            destination: {
                                ProductDetailView(product: product)
                            },
                            label: {
                                VStack {
                                    KFImage(URL(string: product.image ?? ""))
                                        .resizable()
                                        .frame(width: width, height: 100)
                                    
                                    Text(product.name ?? "")
                                        .foregroundColor(
                                            Color(.white)
                                        )
                                        .padding(.horizontal, 2.0)
                                    Spacer()
                                    HStack {
                                        Spacer()
                                        Text("$\(product.price?.formatted() ?? "0.0")").foregroundColor(.white)
                                            .bold()
                                        Spacer()
                                        Spacer()
                                        Button {
                                            
                                        } label: {
                                            Image(systemName: "plus.square.fill").foregroundColor(.white)
                                        }
                                        
                                        Spacer()
                                    }
                                    Spacer()
                                    
                                }.frame(width: width, height: 200, alignment: .center)
                                    .background {
                                        Color(red: 45/255, green: 50/255, blue: 80/255)
                                    }
                                
                            })
                        .cornerRadius(20.0)
                    }
                }
            }.padding(.horizontal, 10.0)
        }else{
            Spacer()
            ProgressView()
            Spacer()
        }
        
    }
}
