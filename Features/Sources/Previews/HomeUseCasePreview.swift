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
    
    public func moviesByGenre() -> AnyPublisher<[Domain.Genre : [Domain.Movie]], Domain.DomainError> {
        let data: [Domain.Genre : [Domain.Movie]] = [
            .action: [.default, .default, .default, .default, .default, .default],
            .commedy: [.default, .default, .default, .default, .default, .default],
            .drama: [.default, .default, .default, .default, .default, .default],
            .horror: [.default, .default, .default, .default, .default, .default]
        ]
        return Just(data)
            .setFailureType(to: Domain.DomainError.self)
            .eraseToAnyPublisher()
    }
}

#endif
