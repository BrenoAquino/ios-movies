//
//  NetworkProvider.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Combine

public protocol NetworkProvider {
    func execute<Model: Decodable>(endpoint: APIs, keyPath: String?) -> AnyPublisher<Model, DataError>
}
