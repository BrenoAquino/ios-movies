//
//  SGVerticalSpace+Extensions.swift
//  Common
//
//  Created by Breno Aquino on 18/12/21.
//

import UIKit

extension UIView {
    
    // MARK: Center
    @discardableResult
    func centerY(id: String? = nil,
                 _ centerY: NSLayoutAnchor<NSLayoutYAxisAnchor>,
                 constant: SGVerticalSpace = .zero,
                 priority: UILayoutPriority? = nil,
                 isActive: Bool = true) -> Self {
        let constraint = centerYAnchor.constraint(equalTo: centerY, constant: constant.rawValue)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    // MARK: Top
    @discardableResult
    func top(id: String? = nil,
             anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
             constant: SGVerticalSpace = .zero,
             priority: UILayoutPriority? = nil,
             isActive: Bool = true) -> Self {
        let constraint = topAnchor.constraint(equalTo: anchor, constant: constant.rawValue)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func top(id: String? = nil,
             lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
             constant: SGVerticalSpace = .zero,
             priority: UILayoutPriority? = nil,
             isActive: Bool = true) -> Self {
        let constraint = topAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant.rawValue)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func top(id: String? = nil,
             greaterThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
             constant: SGVerticalSpace = .zero,
             priority: UILayoutPriority? = nil,
             isActive: Bool = true) -> Self {
        let constraint = topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant.rawValue)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    // MARK: Bottom
    @discardableResult
    func bottom(id: String? = nil,
                anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
                constant: SGVerticalSpace = .zero,
                priority: UILayoutPriority? = nil,
                isActive: Bool = true) -> Self {
        let constraint = bottomAnchor.constraint(equalTo: anchor, constant: constant.rawValue)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func bottom(id: String? = nil,
                lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
                constant: SGVerticalSpace = .zero,
                priority: UILayoutPriority? = nil,
                isActive: Bool = true) -> Self {
        let constraint = bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant.rawValue)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func bottom(id: String? = nil,
                greaterThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
                constant: SGVerticalSpace = .zero,
                priority: UILayoutPriority? = nil,
                isActive: Bool = true) -> Self {
        let constraint = bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant.rawValue)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
}
