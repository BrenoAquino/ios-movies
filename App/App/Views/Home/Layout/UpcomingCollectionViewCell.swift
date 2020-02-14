//
//  UpcomingCollectionViewCell.swift
//  App
//
//  Created by Breno Aquino on 21/10/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
    
    var movie: Movie? {
        didSet { rebind() }
    }
    
    // MARK: - Layout Var
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        label.textColor = .white
        label.textAlignment = .center
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
}

// MARK: - Setups
extension UpcomingCollectionViewCell {
    // MARK: Layout
    private func setupLayout() {
        addSubview(imageView)
        addSubview(title)
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        imageView
            .top(anchor: topAnchor)
            .leading(anchor: leadingAnchor)
            .trailing(anchor: trailingAnchor)
            .bottom(anchor: bottomAnchor)
        
        title
            .leading(anchor: leadingAnchor)
            .trailing(anchor: trailingAnchor)
            .bottom(anchor: bottomAnchor, constant: HomeStyle.movieTitleBottom)
    }
    
    // MARK: Bind
    private func rebind() {
        imageView.imageWithUrl(urlImage: movie?.backdrop, placeholder: .placeholder)
        title.text = movie?.title
    }
}
