//
//  Genre.swift
//  App
//
//  Created by Breno Aquino on 21/10/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import Foundation
import Services

struct Genre {
    let id: Int
    let name: String
    
    init(genre: Services.Genre) {
        id = genre.id
        name = genre.name
    }
}
