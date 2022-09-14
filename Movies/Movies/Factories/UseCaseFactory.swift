//
//  UseCaseFactory.swift
//  Movies
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Domain

enum UseCaseFactory {
    
    static func home() -> HomeUseCase {
        let moviesRepository = RepositoryFactory.movies()
        return HomeUseCaseImpl(moviesRepository: moviesRepository)
    }
}
