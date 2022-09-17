//
//  DetailUseCasePreview.swift
//  
//
//  Created by Breno Aquino on 15/09/22.
//

#if DEBUG
import Foundation
import Domain
import Combine

public class DetailUseCasePreview: Domain.DetailUseCase {
    public init() {}
    
    public func detail(id: Int) -> AnyPublisher<Movie, DomainError> {
        Just(Movie.default)
            .setFailureType(to: DomainError.self)
            .eraseToAnyPublisher()
    }
}

#endif
