//
//  Combine+Decoder.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Combine

extension Publisher where Output == Data {
    
    public func extract(keyPath: String?) -> AnyPublisher<Output, Failure> {
        return map { value in
            if let keyPath = keyPath,
               let json = try? JSONSerialization.jsonObject(with: value, options: []) as? NSDictionary,
               let result = json.value(forKeyPath: keyPath), let nestedJson = try? JSONSerialization.data(withJSONObject: result) {
                return nestedJson
            }
            return value
        }
        .eraseToAnyPublisher()
    }
    
    public func decode<Decoder, Model>(type: Model.Type, decoder: Decoder, keyPath: String?) -> Publishers.Decode<AnyPublisher<Data, Self.Failure>, Model, Decoder>
    where Decoder: TopLevelDecoder, Model: Decodable, Self.Output == Decoder.Input {
        extract(keyPath: keyPath)
            .decode(type: type, decoder: decoder)
    }
}
