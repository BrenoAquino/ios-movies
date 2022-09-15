//
//  DiscoverRemoteDataSource.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Combine

public protocol DiscoverRemoteDataSource {
    func movies(genre: Int) -> AnyPublisher<[Movie], DataError>
}
