//
//  SGConstants.swift
//  Common
//
//  Created by Breno Aquino on 18/12/21.
//

import UIKit

public typealias SGConstants = StyleGuide.Constants
public typealias SGRadius = StyleGuide.Radius

public extension StyleGuide {
    
    enum Constants {
        /// Default Animation Time (0.3s)
        public static let defaultAnimationTime: TimeInterval = 0.3
        /// Default Separator Height (1)
        public static let defaultSeparatorHeight: CGFloat = 1
    }
    
    struct Radius {
        public var rawValue: CGFloat
        
        /// Hard - 16
        public static let hard: Radius = Radius(rawValue: 16)
        /// Normal - 8
        public static let normal: Radius = Radius(rawValue: 8)
        /// Easy - 4
        public static let easy: Radius = Radius(rawValue: 4)
    }
}
