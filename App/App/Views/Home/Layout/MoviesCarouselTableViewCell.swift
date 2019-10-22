//
//  MoviesCarouselTableViewCell.swift
//  App
//
//  Created by Breno Aquino on 18/10/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import UIKit
import Services

class MoviesCarouselTableViewCell: UITableViewCell {
    
    var movies: [Movie] = []
    
    // MARK: - Layout View
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: HomeStyle.movieHeight * .landscapeAspect, height: HomeStyle.movieHeight)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.description())
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
}

// MARK: - Setup
extension MoviesCarouselTableViewCell {
    // MARK: Layout
    func setupLayout() {
        contentView.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        contentView.addSubview(collectionView)
        collectionView
            .top(anchor: contentView.topAnchor)
            .leading(anchor: contentView.leadingAnchor)
            .trailing(anchor: contentView.trailingAnchor)
            .bottom(anchor: contentView.bottomAnchor)
    }
}

// MARK: - CollectionView
extension MoviesCarouselTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.description(), for: indexPath) as! MovieCollectionViewCell
        cell.movie = movies[indexPath.row]
        return cell
    }
}
