//
//  ProductModel.swift
//  Tekno Stilim
//
//  Created by Alkan Ataş on 29.01.2024.
//


import Foundation

// MARK: - Products
struct Products: BaseModel {
    var products: [Product]?
}

// MARK: - Product
struct Product: BaseModel, Identifiable {
    var id: Int?
    var name: String?
    var price: Int?
    var image: String?
    var description: String?
    var category: String?
    var quantity: Int?
    var rating: Double?
    var numReviews: Int?
    var brand: String?
    var createdAt, updatedAt: String?
    var reviews: [Review]?
}

// MARK: - Review
struct Review: BaseModel, Identifiable {
    var id: Int?
    var name: String?
    var rating: Int?
    var comment: String?
    var createdAt, updatedAt: String?
}



