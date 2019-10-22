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
    func width(anchor: NSLayoutDimension, multiplier: CGFloat = 1, constant: CGFloat = 0) -> UIView {
        widthAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func width(constant: CGFloat) -> UIView {
        widthAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func width(lessThanOrEqualTo anchor: NSLayoutDimension, multiplier: CGFloat = 1, constante: CGFloat = 0) -> UIView {
        widthAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constante).isActive = true
        return self
    }
    
    @discardableResult
    func width(greaterThanOrEqualTo anchor: NSLayoutDimension, multiplier: CGFloat = 1, constante: CGFloat = 0) -> UIView {
        widthAnchor.constraint(greaterThanOrEqualTo: anchor, multiplier: multiplier, constant: constante).isActive = true
        return self
    }
    
    @discardableResult
    func width(greaterThanOrEqualToConstant constante: CGFloat) -> UIView {
        widthAnchor.constraint(greaterThanOrEqualToConstant: constante).isActive = true
        return self
    }
    
    @discardableResult
    func width(lessThanOrEqualToConstant constante: CGFloat) -> UIView {
        widthAnchor.constraint(lessThanOrEqualToConstant: constante).isActive = true
        return self
    }
    
    @discardableResult
    func height(anchor: NSLayoutDimension, multiplier: CGFloat = 1, constant: CGFloat = 0) -> UIView {
        widthAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func height(constant: CGFloat) -> UIView {
        heightAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func height(lessThanOrEqualTo anchor: NSLayoutDimension, multiplier: CGFloat = 1, constante: CGFloat = 0) -> UIView {
        heightAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constante).isActive = true
        return self
    }
    
    @discardableResult
    func height(greaterThanOrEqualTo anchor: NSLayoutDimension, multiplier: CGFloat = 1, constante: CGFloat = 0) -> UIView {
        heightAnchor.constraint(greaterThanOrEqualTo: anchor, multiplier: multiplier, constant: constante).isActive = true
        return self
    }
    
    @discardableResult
    func height(greaterThanOrEqualToConstant constante: CGFloat) -> UIView {
        heightAnchor.constraint(greaterThanOrEqualToConstant: constante).isActive = true
        return self
    }
    
    @discardableResult
    func height(lessThanOrEqualToConstant constante: CGFloat) -> UIView {
        heightAnchor.constraint(lessThanOrEqualToConstant: constante).isActive = true
        return self
    }
    
    @discardableResult
    func centerY(_ centerY: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> UIView {
        centerYAnchor.constraint(equalTo: centerY, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func centerX(_ centerX: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> UIView {
        centerXAnchor.constraint(equalTo: centerX, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func top(anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> UIView {
        topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func top(lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> UIView {
        topAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func top(greaterThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> UIView {
        topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func leading(anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> UIView {
        leadingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func leading(lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> UIView {
        leadingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func leading(greaterThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> UIView {
        leadingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func trailing(anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> UIView {
        trailingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func trailing(lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> UIView {
        trailingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func trailing(greaterThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> UIView {
        trailingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func bottom(anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> UIView {
        bottomAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func bottom(lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> UIView {
        bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func bottom(greaterThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> UIView {
        bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func firstBaseline(anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> UIView {
        firstBaselineAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func lastBaseline(anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> UIView {
        lastBaselineAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
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
