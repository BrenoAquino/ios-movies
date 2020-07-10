//
//  KeywordsLayout.swift
//  App
//
//  Created by Breno Aquino on 10/07/20.
//  Copyright © 2020 Breno Aquino. All rights reserved.
//

import UIKit

protocol KeywordsLayoutDataSource: class {
    func widthLimit() -> CGFloat
    func sizeForItem(at indexPath: IndexPath) -> CGSize
}

class KeywordsLayout: UICollectionViewLayout {
    
    var contentInsets: UIEdgeInsets = .zero
    var lineSpacing: CGFloat = 0
    var tagSpacing: CGFloat = 0
    
    weak var dataSource: KeywordsLayoutDataSource?
    private var cacheAttributes: [UICollectionViewLayoutAttributes] = []
    
    private var contentSize = CGSize()
    override var collectionViewContentSize: CGSize { return contentSize }
    
    // MARK: - Creating Layout for Collection
    override func prepare() {
        guard let collectionView = collectionView else { return }
        
        cacheAttributes.removeAll()
        contentSize = collectionView.bounds.size
        
        let widthLimit = dataSource?.widthLimit() ?? UIScreen.main.bounds.width
        var refPoint: CGPoint = CGPoint(x: contentInsets.left, y: contentInsets.top)
        
        for section in 0 ..< collectionView.numberOfSections {
            
            var lineHeight: CGFloat = 0
            
            for item in 0 ..< collectionView.numberOfItems(inSection: section) {
                let indexPath = IndexPath(item: item, section: section)
                let size = dataSource?.sizeForItem(at: indexPath) ?? CGSize(width: 0, height: 0)
                
                lineHeight = max(lineHeight, size.height)
                if refPoint.x + size.width > widthLimit - contentInsets.right {
                    refPoint.x = contentInsets.left
                    refPoint.y += (lineHeight + lineSpacing)
                    lineHeight = 0
                }
                
                let itemWidth = min(size.width, widthLimit - contentInsets.right)
                let itemFrame = CGRect(x: refPoint.x, y: refPoint.y, width: itemWidth, height: size.height)
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = itemFrame
                cacheAttributes.append(attributes)
                refPoint.x += itemWidth + tagSpacing
            }
            
            refPoint.y += lineHeight
            refPoint.x = 0
        }
        
        contentSize.height = refPoint.y + contentInsets.bottom
        contentSize.width = widthLimit
    }
    
    // MARK: - Returing Attributes
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cacheAttributes.filter { $0.frame.intersects(rect) }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cacheAttributes[indexPath.item]
    }
}
