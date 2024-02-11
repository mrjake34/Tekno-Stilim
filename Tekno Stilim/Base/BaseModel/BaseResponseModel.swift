//
//  BaseResponseModel.swift
//  Tekno Stilim
//
//  Created by Alkan Ataş on 11.02.2024.
//

import Foundation


struct BaseResponseModel<T: BaseModel> {
	let data: T?
	let error: String?
	let statusCode: Int?
}
