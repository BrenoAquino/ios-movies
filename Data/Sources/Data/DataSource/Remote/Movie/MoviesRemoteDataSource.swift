//
//  MoviesRemoteDataSource.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Combine

protocol MoviesRemoteDataSource {
    func upcoming() -> AnyPublisher<[Movie], DataError>
}
