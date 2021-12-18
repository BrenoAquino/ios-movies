//
//  BusinessFactory.swift
//  Services
//
//  Created by Breno Aquino on 18/12/21.
//  Copyright © 2021 Breno Aquino. All rights reserved.
//

import Foundation

public enum BusinessFactory {
    
    public static func home() -> HomeBusiness {
        let genre = NetworkFactory.genre()
        let dicover = NetworkFactory.discover()
        let movie = NetworkFactory.movie()
        return HomeBusiness(genreNetwork: genre, discoverNetwork: dicover, movieNetwork: movie)
    }
    
    public static func detail() -> DetailBusiness {
        let movie = NetworkFactory.movie()
        return DetailBusiness(movieNetwork: movie)
    }
}
