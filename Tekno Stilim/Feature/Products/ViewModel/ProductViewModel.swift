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
		Task {
			try await setProducts()
		}
    }
    @Published var data: Products?
	@Published var errorMessage: String?
    
    private let service: IProductService
    
    func setProducts() async throws -> Void {
        let response = try await service.fetchProducts()
		
		guard let rsp = response else {
			return
		}
		
		guard let data = rsp.data else {
			self.errorMessage = response?.error
			return
		}
		self.data = data
		
    }
}

