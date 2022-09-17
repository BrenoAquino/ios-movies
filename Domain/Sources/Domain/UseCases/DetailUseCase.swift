//
//  DetailUseCase.swift
//  
//
//  Created by Breno Aquino on 15/09/22.
//

import Foundation
import Combine

public protocol DetailUseCase {
    func detail(id: Int) -> AnyPublisher<Movie, DomainError>
}
