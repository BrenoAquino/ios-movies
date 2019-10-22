//
//  MovieCollectionViewCell.swift
//  App
//
//  Created by Breno Aquino on 18/10/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import UIKit
import Services

class MovieCollectionViewCell: UICollectionViewCell {
    
    var movie: Movie? {
        didSet { rebind() }
    }
    
    // MARK: - Layout Var
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
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
extension MovieCollectionViewCell {
    // MARK: Layout
    private func setupLayout() {
        contentView.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        contentView.addSubview(imageView)
        imageView
            .top(anchor: imageView.topAnchor)
            .leading(anchor: imageView.leadingAnchor)
            .trailing(anchor: imageView.trailingAnchor)
            .bottom(anchor: imageView.bottomAnchor)
    }
    
    // MARK: Bind
    private func rebind() {
        imageView.imageWithUrl(urlImage: movie?.poster, placeholder: nil)
    }
}
