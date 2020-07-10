//
//  UIView+Constraints.swift
//  App
//
//  Created by Breno Aquino on 18/10/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import UIKit

extension UIView {
    
    @discardableResult
    func width(id: String? = nil, anchor: NSLayoutDimension, multiplier: CGFloat = 1, constant: CGFloat = 0) -> UIView {
        let constraint = widthAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constant)
        constraint.isActive = true
        constraint.identifier = id
        return self
    }
    
    @discardableResult
    func width(id: String? = nil, constant: CGFloat) -> UIView {
        let constraint = widthAnchor.constraint(equalToConstant: constant)
        constraint.isActive = true
        constraint.identifier = id
        return self
    }
    
    @discardableResult
    func width(id: String? = nil, lessThanOrEqualTo anchor: NSLayoutDimension, multiplier: CGFloat = 1, constante: CGFloat = 0) -> UIView {
        let constraint = widthAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constante)
        constraint.isActive = true
        constraint.identifier = id
        return self
    }
    
    @discardableResult
    func width(id: String? = nil, greaterThanOrEqualTo anchor: NSLayoutDimension, multiplier: CGFloat = 1, constante: CGFloat = 0) -> UIView {
        let constraint = widthAnchor.constraint(greaterThanOrEqualTo: anchor, multiplier: multiplier, constant: constante)
        constraint.isActive = true
        constraint.identifier = id
        return self
    }
    
    @discardableResult
    func width(id: String? = nil, greaterThanOrEqualToConstant constante: CGFloat) -> UIView {
        let constraint = widthAnchor.constraint(greaterThanOrEqualToConstant: constante)
        constraint.isActive = true
        constraint.identifier = id
        return self
    }
    
    @discardableResult
    func width(id: String? = nil, lessThanOrEqualToConstant constante: CGFloat) -> UIView {
        let constraint = widthAnchor.constraint(lessThanOrEqualToConstant: constante)
        constraint.isActive = true
        constraint.identifier = id
        return self
    }
    
    @discardableResult
    func height(id: String? = nil, anchor: NSLayoutDimension, multiplier: CGFloat = 1, constant: CGFloat = 0) -> UIView {
        let constraint = widthAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constant)
        constraint.isActive = true
        constraint.identifier = id
        return self
    }
    
    @discardableResult
    func height(id: String? = nil, constant: CGFloat) -> UIView {
        let constraint = heightAnchor.constraint(equalToConstant: constant)
        constraint.isActive = true
        constraint.identifier = id
        return self
    }
    
    @discardableResult
    func height(id: String? = nil, lessThanOrEqualTo anchor: NSLayoutDimension, multiplier: CGFloat = 1, constante: CGFloat = 0) -> UIView {
        let constraint = heightAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constante)
        constraint.isActive = true
        constraint.identifier = id
        return self
    }
    
    @discardableResult
    func height(id: String? = nil, greaterThanOrEqualTo anchor: NSLayoutDimension, multiplier: CGFloat = 1, constante: CGFloat = 0) -> UIView {
        let constraint = heightAnchor.constraint(greaterThanOrEqualTo: anchor, multiplier: multiplier, constant: constante)
        constraint.isActive = true
        constraint.identifier = id
        return self
    }
    
    @discardableResult
    func height(id: String? = nil, greaterThanOrEqualToConstant constante: CGFloat) -> UIView {
        let constraint = heightAnchor.constraint(greaterThanOrEqualToConstant: constante)
        constraint.isActive = true
        constraint.identifier = id
        return self
    }
    
    @discardableResult
    func height(id: String? = nil, lessThanOrEqualToConstant constante: CGFloat) -> UIView {
        let constraint = heightAnchor.constraint(lessThanOrEqualToConstant: constante)
        constraint.isActive = true
        constraint.identifier = id
        return self
    }
    
    @discardableResult
    func centerY(id: String? = nil, _ centerY: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> UIView {
        let constraint = centerYAnchor.constraint(equalTo: centerY, constant: constant)
        constraint.isActive = true
        constraint.identifier = id
        return self
    }
    
    @discardableResult
    func centerX(id: String? = nil, _ centerX: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> UIView {
        let constraint = centerXAnchor.constraint(equalTo: centerX, constant: constant)
        constraint.isActive = true
        constraint.identifier = id
        return self
    }
    
    @discardableResult
    func top(id: String? = nil, anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> UIView {
        let constraint = topAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.isActive = true
        constraint.identifier = id
        return self
    }
    
    @discardableResult
    func top(id: String? = nil, lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> UIView {
        let constraint = topAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        constraint.isActive = true
        constraint.identifier = id
        return self
    }
    
    @discardableResult
    func top(id: String? = nil, greaterThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> UIView {
        let constraint = topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        constraint.isActive = true
        constraint.identifier = id
        return self
    }
    
    @discardableResult
    func leading(id: String? = nil, anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> UIView {
        let constraint = leadingAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.isActive = true
        constraint.identifier = id
        return self
    }
    
    @discardableResult
    func leading(id: String? = nil, lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> UIView {
        let constraint = leadingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        constraint.isActive = true
        constraint.identifier = id
        return self
    }
    
    @discardableResult
    func leading(id: String? = nil, greaterThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> UIView {
        let constraint = leadingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        constraint.isActive = true
        constraint.identifier = id
        return self
    }
    
    @discardableResult
    func trailing(id: String? = nil, anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> UIView {
        let constraint = trailingAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.isActive = true
        constraint.identifier = id
        return self
    }
    
    @discardableResult
    func trailing(id: String? = nil, lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> UIView {
        let constraint = trailingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        constraint.isActive = true
        constraint.identifier = id
        return self
    }
    
    @discardableResult
    func trailing(id: String? = nil, greaterThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> UIView {
        let constraint = trailingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        constraint.isActive = true
        constraint.identifier = id
        return self
    }
    
    @discardableResult
    func bottom(id: String? = nil, anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> UIView {
        let constraint = bottomAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.isActive = true
        constraint.identifier = id
        return self
    }
    
    @discardableResult
    func bottom(id: String? = nil, lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> UIView {
        let constraint = bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        constraint.isActive = true
        constraint.identifier = id
        return self
    }
    
    @discardableResult
    func bottom(id: String? = nil, greaterThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> UIView {
        let constraint = bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        constraint.isActive = true
        constraint.identifier = id
        return self
    }
    
    @discardableResult
    func firstBaseline(id: String? = nil, anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> UIView {
        let constraint = firstBaselineAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.isActive = true
        constraint.identifier = id
        return self
    }
    
    @discardableResult
    func lastBaseline(id: String? = nil, anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> UIView {
        let constraint = lastBaselineAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.isActive = true
        constraint.identifier = id
        return self
    }
}

public extension UIView {
    
    func constraint(first: NSLayoutAnchor<NSLayoutXAxisAnchor>, second: NSLayoutAnchor<NSLayoutXAxisAnchor>) -> NSLayoutConstraint? {
        return superview?.constraints.first(where: { $0.firstAnchor == first && $0.secondAnchor == second })
    }
    
    func constraint(first: NSLayoutAnchor<NSLayoutYAxisAnchor>, second: NSLayoutAnchor<NSLayoutYAxisAnchor>) -> NSLayoutConstraint? {
        return superview?.constraints.first(where: { $0.firstAnchor == first && $0.secondAnchor == second })
    }
    
    func widthConstraint() -> NSLayoutConstraint? {
        return constraints.first(where: { $0.firstAnchor.hashValue == widthAnchor.hashValue })
    }
    
    func heightConstraint() -> NSLayoutConstraint? {
        return constraints.first(where: { $0.firstAnchor.hashValue == heightAnchor.hashValue })
    }
    
    func constraint(id: String) -> NSLayoutConstraint? {
        if let constraint = superview?.constraints.first(where: { $0.identifier == id }) {
            return constraint
        }
        return constraints.first(where: { $0.identifier == id })
    }
}
