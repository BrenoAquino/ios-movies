//
//  URLSessionNetworkProvider.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Combine

class URLSessionNetworkProvider {
    private let session: URLSession
    
    // MARK: Init
    init(session: URLSession) {
        self.session = session
    }
    
    // MARK: Utils
    private func execute<Model: Decodable>(_ request: URLRequest) -> AnyPublisher<Model, DataError> {
        session
            .dataTaskPublisher(for: request)
            .tryMap { (data: Data, response: URLResponse) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: Model.self, decoder: JSONDecoder())
            .mapError { error in
                switch error {
                case let error as URLError:
                    return DataError(code: error.code.rawValue)
                case let error as DataError:
                    return error
                default:
                    return DataError(type: .unkown)
                }
            }
            .eraseToAnyPublisher()
    }
}

// MARK: - Implementation
extension URLSessionNetworkProvider: NetworkProvider {
    func execute<Model: Decodable>(endpoint: APIs, keyPath: String?) -> AnyPublisher<Model, DataError> {
        do {
            let request = try endpoint.createRequest()
            return execute(request)
        } catch let error {
            switch error {
            case let error as DataError:
                return Fail(error: error)
                    .eraseToAnyPublisher()
            default:
                return Fail(error: DataError(type: .unkown))
                    .eraseToAnyPublisher()
            }
        }
    }
}
