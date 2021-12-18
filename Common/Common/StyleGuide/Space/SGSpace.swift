//
//  SGSpace.swift
//  Common
//
//  Created by Breno Aquino on 18/12/21.
//

import UIKit

public typealias SGVerticalSpace = StyleGuide.Space.Vertical
public typealias SGHorizontalSpace = StyleGuide.Space.Horizontal

public extension StyleGuide {
    
    enum Space {
        
        public struct Vertical {
            public var rawValue: CGFloat
            
            /// Big Large - 40
            public static let bigL: Vertical = Vertical(rawValue: 40)
            /// Big Medium - 32
            public static let bigM: Vertical = Vertical(rawValue: 32)
            /// Big Small - 28
            public static let bigS: Vertical = Vertical(rawValue: 28)
            /// Normal - 24
            public static let normal: Vertical = Vertical(rawValue: 24)
            /// Small Large - 16
            public static let smallL: Vertical = Vertical(rawValue: 16)
            /// Small Medium - 8
            public static let smallM: Vertical = Vertical(rawValue: 8)
            /// Small Small - 4
            public static let smallS: Vertical = Vertical(rawValue: 4)
            /// Zero - 0
            public static let zero: Vertical = Vertical(rawValue: 0)
            /// Custom
            public static func custom(_ value: CGFloat) -> Vertical { Vertical(rawValue: value) }
            /// Negative Constants
            public static prefix func -(value: Vertical) -> Vertical {
                return Vertical(rawValue: -value.rawValue)
            }
        }
        
        public struct Horizontal {
            public var rawValue: CGFloat
            
            /// Big Large - 40
            public static let bigL: Horizontal = Horizontal(rawValue: 40)
            /// Big Medium - 32
            public static let bigM: Horizontal = Horizontal(rawValue: 32)
            /// Big Small - 28
            public static let bigS: Horizontal = Horizontal(rawValue: 28)
            /// Normal - 24
            public static let normal: Horizontal = Horizontal(rawValue: 24)
            /// Small Large - 16
            public static let smallL: Horizontal = Horizontal(rawValue: 16)
            /// Small Medium - 8
            public static let smallM: Horizontal = Horizontal(rawValue: 8)
            /// Small Small - 4
            public static let smallS: Horizontal = Horizontal(rawValue: 4)
            /// Zero - 0
            public static let zero: Horizontal = Horizontal(rawValue: 0)
            /// Custom
            public static func custom(_ value: CGFloat) -> Horizontal { Horizontal(rawValue: value) }
            /// Negative Constants
            public static prefix func -(value: Horizontal) -> Horizontal {
                return Horizontal(rawValue: -value.rawValue)
            }
        }
    }
}
