//
//  UICollectionView+Dequeue.swift
//  Common
//
//  Created by Breno Aquino on 18/12/21.
//

import UIKit

public extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: T.description(), for: indexPath) as? T
    }
}
