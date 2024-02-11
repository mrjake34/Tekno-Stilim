//
//  ProductViewModel.swift
//  Tekno Stilim
//
//  Created by Alkan Ataş on 29.01.2024.
//

import SwiftUI
import Combine

class ProductViewModel: ObservableObject {
    
    init(service: IProductService) {
        self.service = service
        setProducts()
    }
    
    @Published var data: Products?
    @Published var isSuccess: Bool?
    
    private let service: IProductService
    
    func setProducts() {
        Task {
            service.fetchProducts() { (data) in
                self.data = data
            }
        }
    }
}

