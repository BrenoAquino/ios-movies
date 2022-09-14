//
//  CGSize+Constants.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import SwiftUI

extension CGSize {
    public var proportionWH: Double {
        width / height
    }
    
    public var proportionHW: Double {
        height / width
    }
    
    public static let portrait: CGSize = CGSize(width: 3, height: 4)
    public static let landscape: CGSize = CGSize(width: 16, height: 9)
}
