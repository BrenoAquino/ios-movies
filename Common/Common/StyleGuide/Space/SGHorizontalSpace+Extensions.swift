//
//  SGHorizontalSpace+Extensions.swift
//  Common
//
//  Created by Breno Aquino on 18/12/21.
//

import UIKit

extension UIView {
    
    // MARK: Center
    @discardableResult
    func centerX(id: String? = nil,
                 _ centerX: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                 constant: SGHorizontalSpace = .zero,
                 priority: UILayoutPriority? = nil,
                 isActive: Bool = true) -> Self {
        let constraint = centerXAnchor.constraint(equalTo: centerX, constant: constant.rawValue)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    // MARK: Leading
    @discardableResult
    func leading(id: String? = nil,
                 anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                 constant: SGHorizontalSpace = .zero,
                 priority: UILayoutPriority? = nil,
                 isActive: Bool = true) -> Self {
        let constraint = leadingAnchor.constraint(equalTo: anchor, constant: constant.rawValue)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func leading(id: String? = nil,
                 lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                 constant: SGHorizontalSpace = .zero,
                 priority: UILayoutPriority? = nil,
                 isActive: Bool = true) -> Self {
        let constraint = leadingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant.rawValue)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func leading(id: String? = nil,
                 greaterThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                 constant: SGHorizontalSpace = .zero,
                 priority: UILayoutPriority? = nil,
                 isActive: Bool = true) -> Self {
        let constraint = leadingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant.rawValue)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    // MARK: Trailing
    @discardableResult
    func trailing(id: String? = nil,
                  anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                  constant: SGHorizontalSpace = .zero,
                  priority: UILayoutPriority? = nil,
                  isActive: Bool = true) -> Self {
        let constraint = trailingAnchor.constraint(equalTo: anchor, constant: constant.rawValue)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func trailing(id: String? = nil,
                  lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                  constant: SGHorizontalSpace = .zero,
                  priority: UILayoutPriority? = nil,
                  isActive: Bool = true) -> Self {
        let constraint = trailingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant.rawValue)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func trailing(id: String? = nil,
                  greaterThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                  constant: SGHorizontalSpace = .zero,
                  priority: UILayoutPriority? = nil,
                  isActive: Bool = true) -> Self {
        let constraint = trailingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant.rawValue)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
}
