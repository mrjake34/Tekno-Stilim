//
//  ServiceManager.swift
//  Tekno Stilim
//
//  Created by Alkan Ataş on 9.02.2024.
//

import Foundation
import Alamofire

protocol IServiceManager {
    func request<T: BaseModel>(baseUrl: String, model: T.Type, comletion: @escaping (T?) -> Void)
}

final class ServiceManager: IServiceManager {
    func request<T: BaseModel>(baseUrl: String, model: T.Type, comletion: @escaping (T?) -> Void) {
        AF.request(baseUrl)
            .responseDecodable(of: T.self,
                               completionHandler: {
                response in
                guard let value = response.value else {
                    comletion(nil)
                    return
                }
                comletion(value)
            })
    }
}
