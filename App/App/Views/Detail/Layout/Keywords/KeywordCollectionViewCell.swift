//
//  KeywordCollectionViewCell.swift
//  App
//
//  Created by Breno Aquino on 10/07/20.
//  Copyright © 2020 Breno Aquino. All rights reserved.
//

import UIKit

class KeywordCollectionViewCell: UICollectionViewCell {
    
    var title: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    // MARK: - Layout Vars
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    // MARK: - Life Cycle
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    // MARK: - Setups
    private func setupLayout() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = DetailStyle.keywordCellHeight / 2
        clipsToBounds = true
        addSubview(titleLabel)
        
        titleLabel
            .top(anchor: topAnchor)
            .leading(anchor: leadingAnchor, constant: DetailStyle.keywordTitleLeading)
            .trailing(anchor: trailingAnchor, constant: DetailStyle.keywordTitleTrailing)
            .bottom(anchor: bottomAnchor)
    }
}
