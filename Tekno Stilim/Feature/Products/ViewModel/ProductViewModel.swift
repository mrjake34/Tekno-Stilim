//
//  ProductViewModel.swift
//  Tekno Stilim
//
//  Created by Alkan Ataş on 29.01.2024.
//

import SwiftUI
import Combine

final class ProductViewModel: ObservableObject {
	@Published var data: Products?
	@Published var errorMessage: String?
	
	private let service: IProductService
	
	init(service: IProductService) {
        self.service = service
		Task {
			await setProducts()
		}
    }
	
	fileprivate func setProducts() async -> Void {
		let response = await service.fetchProducts()
		
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

