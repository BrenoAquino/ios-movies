//
//  NSLayoutConstraint+setContraint.swift
//  Common
//
//  Created by Breno Aquino on 18/12/21.
//

import UIKit

public extension NSLayoutConstraint {
    func set(id: String? = nil, priority: UILayoutPriority? = nil, isActive: Bool = true) {
        identifier = id
        if let priority = priority { self.priority = priority }
        self.isActive = isActive
    }
}
