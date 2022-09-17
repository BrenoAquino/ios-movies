//
//  HomeUseCasePreview.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

#if DEBUG
import Foundation
import Domain
import Combine

public class HomeUseCasePreview: Domain.HomeUseCase {
    public init() {}
    
    public func moviesByGenre() -> AnyPublisher<[Int : [Domain.Movie]], Domain.DomainError> {
        let data: [Int : [Domain.Movie]] = [
            0: [.default, .default, .default, .default, .default, .default]
        ]
        return Just(data)
            .setFailureType(to: Domain.DomainError.self)
            .eraseToAnyPublisher()
    }
}

#endif
