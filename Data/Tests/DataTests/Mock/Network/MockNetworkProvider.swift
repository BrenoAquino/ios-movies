//
//  MockNetworkProvider.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Combine

@testable import Data

class TypeSpyNetworkProvider: NetworkProvider {
    
    var decodableType: Decodable.Type?
    var api: APIs?
    
    func execute<Model: Decodable>(endpoint: APIs, keyPath: String?) -> AnyPublisher<Model, DataError> {
        decodableType = Model.self
        api = endpoint
        return Empty().eraseToAnyPublisher()
    }
}
