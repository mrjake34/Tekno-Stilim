	//
	//  PokemonDetailView.swift
	//  Tekno Stilim
	//
	//  Created by Alkan Ataş on 9.02.2024.
	//

import SwiftUI
import Kingfisher

struct ProductDetailView: View {
	var product: Product
	var body: some View {
		VStack() {
			VStack(spacing: 0, content: {
				ImageView(product: product)
				DetailView(product: product)
			})
			Spacer()
		}.navigationTitle(product.name ?? "")
	}
}

#Preview {
	ProductDetailView(
		product: DummyData.getSimpleProduct()
	)
}

struct ImageView: View {
	var product: Product
	var body: some View {
		KFImage(URL(string: product.image ?? "")).resizable()
			.foregroundColor(.gray)
			.scaledToFit()
	}
}

struct DetailView: View {
	var product: Product
	var body: some View {
		VStack {
			ContentView(product: product)
			HStack(content: {
				Button {
					print("Add To Card")
				} label: {
					Text("Add To Card")
						.foregroundColor(.black)
				}
				Spacer()
				Button {
					print("Buy Now")
				} label: {
					HStack {
						Text("Buy Now")
							.foregroundColor(.white)
							.frame(width: UIScreen.main.bounds.width / 3, height: 45)
					}
				}
				.background(Color(.systemBlue))
				.cornerRadius(5)
			})
			.padding(.horizontal, 30)
			
		}
	}
}

struct ContentView: View {
	var product: Product
	var body: some View {
		ScrollView {
			VStack(alignment: .leading, content: {
				HStack(content: {
					Text("(4)")
					ForEach(0 ..< 4 ) {_ in
						Image(systemName: "star.fill")
							.foregroundColor(.yellow)
					}
					Spacer()
					Text("$\(product.price?.formatted() ?? "")")
						.font(.title2)
						.foregroundColor(.red)
						.fontWeight(.semibold)
				})
				HStack {
					Text("\(product.name ?? "")")
						.font(.title2)
						.fontWeight(.semibold)
						.padding(.vertical, 7.0)
					Spacer()
				}
				HStack {
					ZStack {
						Capsule()
							.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 30)
							.foregroundColor(Color(red: 45/255, green: 50/255, blue: 80/255))
						Text("\(product.brand ?? "")")
							.foregroundColor(.white)
					}
					ZStack {
						Capsule()
							.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 30)
							.foregroundColor(PublicVariables.cardColor)
						Text("\(product.category ?? "")")
							.foregroundColor(.white)
					}
				}
				Text("Description")
					.padding(.vertical, 3.0)
					.font(.title3)
					.fontWeight(.semibold)
				Text(product.description ?? "")
					.padding(.vertical, 3.0)
					.padding(.bottom, 10)
				Divider()
				VStack(alignment: .leading) {
					Section {
						ForEach(product.reviews ?? []) { data in
							HStack {
								Text(data.name ?? "")
									.fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
								Spacer()
								ForEach(0..<5) { index in
									if let rating = data.rating, index < rating {
										Image(systemName: "star.fill")
											.foregroundColor(.yellow)
									}
								}
							}
							.padding(.vertical, 3.0)
							Text(data.comment ?? "")
								.padding(.vertical, 3.0)
							Divider()
							
						}
					} header: {
						Text("Comments")
							.font(.title3)
							.fontWeight(.semibold)
					}
				}
				
			}).padding(.all)
		}
	}
}
