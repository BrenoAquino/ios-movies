//
//  UIView+Constraints.swift
//  Common
//
//  Created by Breno Aquino on 18/12/21.
//

import UIKit

/// The top, bottom, trailing and leading implemented with style guide
// MARK: - Find Constraint
public extension UIView {
    func constraint(id: String) -> NSLayoutConstraint? {
        if let constraint = superview?.constraints.first(where: { $0.identifier == id }) {
            return constraint
        }
        return constraints.first(where: { $0.identifier == id })
    }
}

// MARK: - Fill
public extension UIView {
    @discardableResult
    func fill(in view: UIView, priority: UILayoutPriority? = nil) -> Self {
        top(anchor: view.topAnchor, priority: priority)
        leading(anchor: view.leadingAnchor, priority: priority)
        trailing(anchor: view.trailingAnchor, priority: priority)
        bottom(anchor: view.bottomAnchor, priority: priority)
        return self
    }

    @discardableResult
    func fillWithSafeAres(in view: UIView, priority: UILayoutPriority? = nil) -> Self {
        top(anchor: view.safeAreaLayoutGuide.topAnchor, priority: priority)
        leading(anchor: view.safeAreaLayoutGuide.leadingAnchor, priority: priority)
        trailing(anchor: view.safeAreaLayoutGuide.trailingAnchor, priority: priority)
        bottom(anchor: view.safeAreaLayoutGuide.bottomAnchor, priority: priority)
        return self
    }
}

// MARK: - Size
public extension UIView {
    @discardableResult
    func size(_ size: CGSize) -> UIView {
        height(constant: size.height)
        width(constant: size.width)
        return self
    }

    @discardableResult
    func width(id: String? = nil,
               anchor: NSLayoutDimension,
               multiplier: CGFloat = 1,
               constant: CGFloat = 0,
               priority: UILayoutPriority? = nil,
               isActive: Bool = true) -> UIView {
        let constraint = widthAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constant)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }

    @discardableResult
    func width(id: String? = nil,
               constant: CGFloat,
               priority: UILayoutPriority? = nil,
               isActive: Bool = true) -> UIView {
        let constraint = widthAnchor.constraint(equalToConstant: constant)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }

    @discardableResult
    func width(id: String? = nil,
               lessThanOrEqualTo anchor: NSLayoutDimension,
               multiplier: CGFloat = 1,
               constante: CGFloat = 0,
               priority: UILayoutPriority? = nil,
               isActive: Bool = true) -> UIView {
        let constraint = widthAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constante)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }

    @discardableResult
    func width(id: String? = nil,
               greaterThanOrEqualTo anchor: NSLayoutDimension,
               multiplier: CGFloat = 1,
               constante: CGFloat = 0,
               priority: UILayoutPriority? = nil,
               isActive: Bool = true) -> UIView {
        let constraint = widthAnchor.constraint(greaterThanOrEqualTo: anchor, multiplier: multiplier, constant: constante)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }

    @discardableResult
    func width(id: String? = nil,
               greaterThanOrEqualToConstant constante: CGFloat,
               priority: UILayoutPriority? = nil,
               isActive: Bool = true) -> UIView {
        let constraint = widthAnchor.constraint(greaterThanOrEqualToConstant: constante)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }

    @discardableResult
    func width(id: String? = nil,
               lessThanOrEqualToConstant constante: CGFloat,
               priority: UILayoutPriority? = nil,
               isActive: Bool = true) -> UIView {
        let constraint = widthAnchor.constraint(lessThanOrEqualToConstant: constante)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }

    @discardableResult
    func height(id: String? = nil,
                anchor: NSLayoutDimension,
                multiplier: CGFloat = 1,
                constant: CGFloat = 0,
                priority: UILayoutPriority? = nil,
                isActive: Bool = true) -> UIView {
        let constraint = widthAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constant)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }

    @discardableResult
    func height(id: String? = nil, constant: CGFloat, priority: UILayoutPriority? = nil, isActive: Bool = true) -> UIView {
        let constraint = heightAnchor.constraint(equalToConstant: constant)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }

    @discardableResult
    func height(id: String? = nil,
                lessThanOrEqualTo anchor: NSLayoutDimension,
                multiplier: CGFloat = 1,
                constante: CGFloat = 0,
                priority: UILayoutPriority? = nil,
                isActive: Bool = true) -> UIView {
        let constraint = heightAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constante)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }

    @discardableResult
    func height(id: String? = nil,
                greaterThanOrEqualTo anchor: NSLayoutDimension,
                multiplier: CGFloat = 1,
                constante: CGFloat = 0,
                priority: UILayoutPriority? = nil,
                isActive: Bool = true) -> UIView {
        let constraint = heightAnchor.constraint(greaterThanOrEqualTo: anchor, multiplier: multiplier, constant: constante)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }

    @discardableResult
    func height(id: String? = nil,
                greaterThanOrEqualToConstant constante: CGFloat,
                priority: UILayoutPriority? = nil,
                isActive: Bool = true) -> UIView {
        let constraint = heightAnchor.constraint(greaterThanOrEqualToConstant: constante)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }

    @discardableResult
    func height(id: String? = nil,
                lessThanOrEqualToConstant constante: CGFloat,
                priority: UILayoutPriority? = nil,
                isActive: Bool = true) -> UIView {
        let constraint = heightAnchor.constraint(lessThanOrEqualToConstant: constante)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
}
