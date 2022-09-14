//
//  GenresRepository.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Combine

public protocol GenresRepository {
    func genres() -> AnyPublisher<[Genre], DomainError>
}
