//
//  KeywordsTableViewCell.swift
//  App
//
//  Created by Breno Aquino on 10/07/20.
//  Copyright © 2020 Breno Aquino. All rights reserved.
//

import UIKit

class KeywordsTableViewCell: UITableViewCell {
    
    static let collectionViewHeight = "collectionViewHeight"
    
    var keywords: [String] = [] {
        didSet {
            collectionView.reloadData()
            collectionView.collectionViewLayout.prepare()
            
            let height = collectionView.collectionViewLayout.collectionViewContentSize.height
            collectionView.constraint(id: Self.collectionViewHeight)?.constant = height
        }
    }
    
    // MARK: - Layout Vars
    private lazy var collectionView: UICollectionView = {
        let layout = KeywordsLayout()
        layout.dataSource = self
        layout.tagSpacing = 8
        layout.lineSpacing = 8
        layout.contentInsets.left = .defaultLeading
        layout.contentInsets.right = abs(.defaultTrailing)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(cells: [KeywordCollectionViewCell.self])
        return collectionView
    }()
    
    // MARK: - Life Cycle
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    // MARK: - Setups
    private func setupLayout() {
        backgroundColor = .clear
        addSubview(collectionView)
        
        collectionView
            .top(anchor: topAnchor)
            .leading(anchor: leadingAnchor)
            .trailing(anchor: trailingAnchor)
            .bottom(anchor: bottomAnchor, constant: .defaultBottom)
            .height(id: Self.collectionViewHeight, constant: 0)
    }
}

// MARK: - CollectionView
// MARK: Layout
extension KeywordsTableViewCell: KeywordsLayoutDataSource {
    func widthLimit() -> CGFloat { return UIScreen.main.bounds.width }
    func sizeForItem(at indexPath: IndexPath) -> CGSize {
        let estimatedTextWidth = keywords[indexPath.item].width(font: UIFont.systemFont(ofSize: 14, weight: .regular))
        let estimatedWidth = estimatedTextWidth + DetailStyle.keywordTitleLeading + abs(DetailStyle.keywordTitleTrailing)
        return CGSize(width: estimatedWidth, height: DetailStyle.keywordCellHeight)
    }
}

// MARK: Collection
extension KeywordsTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keywords.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeywordCollectionViewCell.description(), for: indexPath) as! KeywordCollectionViewCell
        cell.title = keywords[indexPath.item]
        return cell
    }
}
