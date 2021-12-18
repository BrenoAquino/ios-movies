//
//  SGColor.swift
//  Common
//
//  Created by Breno Aquino on 18/12/21.
//

import UIKit

// MARK: - UIColor with Hex
extension UIColor {
    convenience init(rgba: UInt32) {
        let red = CGFloat((rgba >> 24) & 0xff) / 255.0
        let green = CGFloat((rgba >> 16) & 0xff) / 255.0
        let blue = CGFloat((rgba >> 8) & 0xff) / 255.0
        let alpha = CGFloat((rgba) & 0xff) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

// MARK: - Style Guide
public typealias SGColor = StyleGuide.Color

public extension StyleGuide {
    
    struct Color {
        public var rawValue: UIColor
        
        public var cgColor: CGColor {
            rawValue.cgColor
        }
        
        /// Color HEX 0xFFFFFF with alpha 0%
        public static let clear: Color = Color(rawValue: UIColor(rgba: 0xFFFFFF00))
        /// Color HEX 0x000000 with alpha 100%
        public static let black: Color = Color(rawValue: UIColor(rgba: 0x000000FF))
        /// Color HEX 0xFFFFFF with alpha 100%
        public static let white: Color = Color(rawValue: UIColor(rgba: 0xFFFFFFFF))
    }
}
