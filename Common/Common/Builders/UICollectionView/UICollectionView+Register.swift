//
//  UICollectionView+Register.swift
//  Common
//
//  Created by Breno Aquino on 18/12/21.
//

import UIKit

public extension UICollectionView {
    
    enum ElementKind {
        case header
        case footer
        
        var stringValue: String {
            switch self {
            case .header:
                return UICollectionView.elementKindSectionHeader
            case .footer:
                return UICollectionView.elementKindSectionFooter
            }
        }
    }
    
    @discardableResult
    func register(cell: AnyClass) -> Self {
        register(cell, forCellWithReuseIdentifier: cell.description())
        return self
    }
    
    @discardableResult
    func register(view: AnyClass, elementKind: ElementKind) -> Self {
        register(view, forSupplementaryViewOfKind: elementKind.stringValue, withReuseIdentifier: view.description())
        return self
    }
}
