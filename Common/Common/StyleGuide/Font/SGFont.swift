//
//  SGFont.swift
//  Common
//
//  Created by Breno Aquino on 18/12/21.
//

import UIKit

public typealias SGFont = StyleGuide.Font

public extension StyleGuide {
    
    struct Font {
        public var rawValue: UIFont
        
        /// System Font - Bold - Size 24
        public static let title: Font = Font(rawValue: .systemFont(ofSize: 24, weight: .bold))
        /// System Font - Medium - Size 16
        public static let subhead: Font = Font(rawValue: .systemFont(ofSize: 16, weight: .medium))
        /// System Font - Regular - Size 10
        public static let caption1: Font = Font(rawValue: .systemFont(ofSize: 10, weight: .regular))
        /// System Font - Regular - Size 8
        public static let caption2: Font = Font(rawValue: .systemFont(ofSize: 8, weight: .regular))
    }
}
