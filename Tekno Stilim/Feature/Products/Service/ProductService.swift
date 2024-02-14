//
//  ProductService.swift
//  Tekno Stilim
//
//  Created by Alkan Ataş on 9.02.2024.
//

import Foundation
import Alamofire

protocol IProductService {
	func fetchProducts() async -> BaseResponseModel<Products>?
}
@MainActor
final class ProductService: IProductService {
    private var baseUrl = "https://gist.githubusercontent.com/mrjake34/0a8c6795bda1e5feebab02ea8fc56db3/raw/a2a847d319153359626aca252f90cc754b354f5a/gistfile1.txt"
    
    private var serviceManager: IServiceManager?
    
    init() {
        self.serviceManager = ServiceManager()
    }
	@MainActor
	func fetchProducts() async -> BaseResponseModel<Products>? {
		return await serviceManager?.request(baseUrl: baseUrl, model: Products.self)
    }
}
