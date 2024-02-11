	//
	//  ServiceManager.swift
	//  Tekno Stilim
	//
	//  Created by Alkan Ataş on 9.02.2024.
	//

import Foundation
import Alamofire

protocol IServiceManager {
	func request<T: BaseModel>(baseUrl: String, model: T.Type) async throws -> BaseResponseModel<T>?
}

final class ServiceManager: IServiceManager {
	func request<T: BaseModel>(baseUrl: String, model: T.Type) async throws -> BaseResponseModel<T>? {
		
		let response = await AF.request(baseUrl)
			.validate()
			.serializingDecodable(T.self)
			.response
		return BaseResponseModel(
			data: response.value,
			error: response.error?.localizedDescription,
			statusCode: response.response?.statusCode
		)
		
	}
}
