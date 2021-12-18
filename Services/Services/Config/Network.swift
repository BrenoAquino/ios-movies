//
//  NetworkProvider.swift
//  Services
//
//  Created by Breno Aquino on 29/09/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import Moya

protocol Network: AnyObject {
    associatedtype TargetApi: Moya.TargetType
    var provider: MoyaProvider<TargetApi> { get }
    
    func execute<ModelT: Decodable, ErrorT: MError>(api: TargetApi, atKeyPath: String?, callback: @escaping (Result<ModelT, ErrorT>) -> Void) -> Cancellable
    func execute(api: TargetApi, atKeyPath: String?, callback: @escaping (Result<Response, MoyaError>) -> Void) -> Cancellable
}

extension Network {
    @discardableResult
    func execute<ModelT: Decodable, ErrorT: MError>(api: TargetApi, atKeyPath: String? = nil, callback: @escaping (Result<ModelT, ErrorT>) -> Void) -> Cancellable {
        return provider.request(api) { result in
            switch result {
            case .success(let response):
                do {
                    let model = try response.map(ModelT.self, atKeyPath: atKeyPath, using: JSONDecoder(), failsOnEmptyData: true)
                    callback(.success(model))
                } catch {
                    callback(.failure(ErrorT(type: .encoding)))
                }
            case .failure(let error):
                callback(.failure(ErrorT(error)))
            }
        }
    }
    
    @discardableResult
    func execute(api: TargetApi, atKeyPath: String? = nil, callback: @escaping (Result<Response, MoyaError>) -> Void) -> Cancellable {
        return provider.request(api) { result in
            switch result {
            case .success(let response):
                callback(.success(response))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}
