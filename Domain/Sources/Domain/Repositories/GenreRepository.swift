//
//  GenreRepository.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Combine

public protocol GenreRepository {
    func genres() -> AnyPublisher<[Genre], DomainError>
}
