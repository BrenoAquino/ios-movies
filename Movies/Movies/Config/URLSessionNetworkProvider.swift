//
//  URLSessionNetworkProvider.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Combine
import Data
import SPMCommon

public class URLSessionNetworkProvider {
    private let session: URLSession
    
    // MARK: Init
    public init(session: URLSession) {
        self.session = session
    }
    
    // MARK: Utils
    private func execute<Model: Decodable>(_ request: URLRequest, keyPath: String?) -> AnyPublisher<Model, DataError> {
        session
            .dataTaskPublisher(for: request)
            .tryMap { (data: Data, response: URLResponse) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: Model.self, decoder: JSONDecoder(), keyPath: keyPath)
            .mapError { error in
                switch error {
                case _ as URLError:
                    return DataError(type: .badServerResponse, message: "Unexpected error on request.", url: request.url)
                case let error as DataError:
                    return error
                default:
                    return DataError(type: .unkown, message: "Unknow error on request.", url: request.url)
                }
            }
            .eraseToAnyPublisher()
    }
}

// MARK: - Implementation
extension URLSessionNetworkProvider: NetworkProvider {
    public func execute<Model: Decodable>(endpoint: APIs, keyPath: String?) -> AnyPublisher<Model, DataError> {
        do {
            let request = try endpoint.createRequest()
            return execute(request, keyPath: keyPath)
        } catch let error {
            switch error {
            case let error as DataError:
                return Fail(error: error)
                    .eraseToAnyPublisher()
            default:
                let error = DataError(type: .unkown, message: "Unknow error on request.", endpoint: endpoint)
                return Fail(error: error)
                    .eraseToAnyPublisher()
            }
        }
    }
}
