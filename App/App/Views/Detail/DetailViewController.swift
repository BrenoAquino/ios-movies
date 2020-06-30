//
//  DetailViewController.swift
//  App
//
//  Created by Breno Aquino on 27/06/20.
//  Copyright © 2020 Breno Aquino. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let viewModel: DetailViewModel!
    
    // MARK: - Layout Vars
    private lazy var backgropImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var blur: UIVisualEffectView = {
        let blur = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        blur.translatesAutoresizingMaskIntoConstraints = false
        blur.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        return blur
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.register(cells: [PosterTableViewCell.self,
                                   MetadataTableViewCell.self,
                                   MoviesCarouselTableViewCell.self])
        return tableView
    }()
    
    // MARK: - Live Cycle
    required init?(coder: NSCoder) {
        fatalError("init?(coder:)")
    }
    
    init(id: Int) {
        viewModel = DetailViewModel(id: id)
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setTransparent(to: true)
        setupLayout()
        setupStatus()
        viewModel.detail()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // MARK: - Setups
    func setupLayout() {
        view.clipsToBounds = true
        view.backgroundColor = .primaryBackgorund
        view.addSubview(backgropImage)
        view.addSubview(blur)
        view.addSubview(tableView)
        
        backgropImage
            .top(anchor: view.topAnchor)
            .leading(anchor: view.leadingAnchor)
            .trailing(anchor: view.trailingAnchor)
            .bottom(anchor: view.bottomAnchor)
        
        blur
            .top(anchor: backgropImage.topAnchor)
            .leading(anchor: backgropImage.leadingAnchor)
            .trailing(anchor: backgropImage.trailingAnchor)
            .bottom(anchor: backgropImage.bottomAnchor)
        
        tableView
            .top(anchor: view.topAnchor)
            .leading(anchor: view.leadingAnchor)
            .trailing(anchor: view.trailingAnchor)
            .bottom(anchor: view.bottomAnchor)
    }
    
    func setupStatus() {
        viewModel.onDetailSucess = { [weak self] in
            DispatchQueue.main.async {
                self?.backgropImage.imageWithUrl(urlImage: self?.viewModel.movie?.backdrop)
                self?.tableView.reloadData()
            }
        }
        
        viewModel.onFailure = { state in
            print(state)
        }
    }
}

// MARK: - TableView
extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.item {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: PosterTableViewCell.description()) as! PosterTableViewCell
            cell.movie = viewModel.movie
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: MetadataTableViewCell.description()) as! MetadataTableViewCell
            cell.movie = viewModel.movie
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: MoviesCarouselTableViewCell.description()) as! MoviesCarouselTableViewCell
            cell.movies = viewModel.movie?.recomendations ?? []
            cell.setupHeight(200, aspect: .portraitAspect)
            return cell
        default:
            return UITableViewCell()
        }
    }
}
