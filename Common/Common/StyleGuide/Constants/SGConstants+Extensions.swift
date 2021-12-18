//
//  SGConstants+Extensions.swift
//  Common
//
//  Created by Breno Aquino on 18/12/21.
//

import UIKit

public extension CALayer {
    @discardableResult
    func cornerRadius(_ radius: SGRadius) -> Self {
        cornerRadius = radius.rawValue
        return self
    }
    
    @discardableResult
    func shadowRadius(_ radius: SGRadius) -> Self {
        shadowRadius = radius.rawValue
        return self
    }
}
