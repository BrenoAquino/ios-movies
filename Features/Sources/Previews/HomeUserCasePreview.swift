//
//  File.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

#if DEBUG
import Foundation
import Domain
import Combine

public class HomeUserCasePreview: Domain.HomeUseCase {
    public init() {}
    
    public func moviesByGenre() -> AnyPublisher<[Int : [Domain.Movie]], Domain.DomainError> {
        let data: [Int : [Domain.Movie]] = [
            0: [
                .init(name: "Movie Name", poster: "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80"),
                .init(name: "Movie Name", poster: "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80"),
                .init(name: "Movie Name", poster: "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80"),
                .init(name: "Movie Name", poster: "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80"),
                .init(name: "Movie Name", poster: "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80")
            ]
        ]
        return Just(data)
            .setFailureType(to: Domain.DomainError.self)
            .eraseToAnyPublisher()
    }
}

#endif
