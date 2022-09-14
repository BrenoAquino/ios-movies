//
//  MoviesRepository.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Combine

public protocol MoviesRepository {
    func upcoming() -> AnyPublisher<[Movie], DomainError>
}
