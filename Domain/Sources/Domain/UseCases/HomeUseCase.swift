//
//  HomeUseCase.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Combine

public protocol HomeUseCase {
    func moviesByGenre() -> AnyPublisher<[Genre : [Movie]], DomainError>
}
