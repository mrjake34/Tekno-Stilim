//
//  PokemonDetailView.swift
//  Tekno Stilim
//
//  Created by Alkan Ataş on 9.02.2024.
//

import SwiftUI
import Kingfisher

struct ProductDetailView: View {
    var product: Product?
    var body: some View {
        VStack() {
            VStack(spacing: 0, content: {
                ImageView(product: product)
                DetailView(product: product)
            })
            Spacer()
		}.navigationTitle(product?.name ?? "")
    }
}

#Preview {
    ProductDetailView(
        product: DummyData.getSimpleProduct()
    )
}

struct ImageView: View {
    var product: Product?
    var body: some View {
        KFImage(URL(string: product?.image ?? "")).resizable()
            .foregroundColor(.gray)
            .scaledToFit()
    }
}

struct DetailView: View {
    var product: Product?
    var body: some View {
        VStack(alignment: .leading, spacing: 5.0) {
            Text("Name: \(product?.name ?? "")")
                .font(.headline)
            Text("Brand: \(product?.brand ?? "")")
            Text("Category: \(product?.category ?? "")")
            Text("Price: \(product?.price?.formatted() ?? "")")
        }
    }
}
