//
//  GenreUI.swift
//  
//
//  Created by Breno Aquino on 17/09/22.
//

import Foundation
import Domain
import SwiftUI

struct GenreUI {
    let id: Int
    let name: String
    
    init(genre: Domain.Genre) {
        id = genre.id
        name = genre.name
    }
}
