//
//  GenreRemoteDataSource.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Combine

public protocol GenreRemoteDataSource {
    func genres() -> AnyPublisher<[Genre], DataError>
}
