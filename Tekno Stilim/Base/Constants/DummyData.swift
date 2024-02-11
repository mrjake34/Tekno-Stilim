//
//  DummyData.swift
//  Tekno Stilim
//
//  Created by Alkan Ataş on 10.02.2024.
//

import Foundation

final class DummyData {
    static func getSimpleProduct() -> Product {
        return Product(
            id: 1,
            name: "Macbook Pro M1 2020",
            price: 2000,
            image: "https://www.cnet.com/a/img/resize/ef6793231464c98cdb3e5e9ffb780405eb2a8427/hub/2021/10/23/80425069-0d3e-4c67-9085-a66e6177fc60/macbook-pro-2021-cnet-review-12.jpg?auto=webp&fit=crop&height=362&width=644",
            description: "The new Macbook Pro M1 2020 is the best laptop for developers and designers",
            category: "Laptop",
            quantity: 10,
            rating: 4.5,
            numReviews: 10,
            brand: "Apple",
            reviews: [
                Review(
                    id: 1,
                    name: "John Doe",
                    rating: 5,
                    comment: "The best laptop I have ever used"
                ),
                Review(
                    id: 2,
                    name: "Jane Doe",
                    rating: 4,
                    comment: "The laptop is great but the price is too high"
                ),
            ]
        )
    }
}
