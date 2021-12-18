//
//  UIView+Constraints.swift
//  Common
//
//  Created by Breno Aquino on 18/12/21.
//

import UIKit

public extension UIView {
    
    @discardableResult
    func useConstraint() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    @discardableResult
    func dontUseConstraint() -> Self {
        translatesAutoresizingMaskIntoConstraints = true
        return self
    }
    
    @discardableResult
    func disableUserInteraction() -> Self {
        isUserInteractionEnabled = false
        return self
    }
    
    @discardableResult
    func enableUserInteraction() -> Self {
        isUserInteractionEnabled = true
        return self
    }
    
    @discardableResult
    func hide() -> Self {
        isHidden = true
        return self
    }
}
