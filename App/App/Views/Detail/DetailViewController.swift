//
//  DetailViewController.swift
//  App
//
//  Created by Breno Aquino on 27/06/20.
//  Copyright © 2020 Breno Aquino. All rights reserved.
//

import UIKit

enum DetailTableViewSection: Int, CaseIterable {
    case poster
    case metadata
    case keywords
    case recomendations
}

class DetailViewController: UIViewController {
    
    private let viewModel: DetailViewModel!
    
    // MARK: - Layout Vars
    private lazy var navigationBlur: UIVisualEffectView = {
        let blurView  = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.isUserInteractionEnabled = false
        blurView.alpha = 0
        return blurView
    }()
    
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
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(CarouselHeaderView.self, forHeaderFooterViewReuseIdentifier: CarouselHeaderView.description())
        tableView.register(cells: [PosterTableViewCell.self,
                                   MetadataTableViewCell.self,
                                   KeywordsTableViewCell.self,
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
        setupLayout()
        setupStatus()
        viewModel.detail()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.setTransparent(to: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.setTransparent(to: false)
    }
    
    // MARK: - Setups
    func setupLayout() {
        view.clipsToBounds = true
        view.backgroundColor = .primaryBackgorund
        view.addSubview(backgropImage)
        view.addSubview(blur)
        view.addSubview(tableView)
        view.addSubview(navigationBlur)
        
        navigationBlur
            .top(anchor: view.topAnchor)
            .leading(anchor: view.leadingAnchor)
            .trailing(anchor: view.trailingAnchor)
            .bottom(anchor: view.safeAreaLayoutGuide.topAnchor)
        
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

// MARK: - Select Movie
extension DetailViewController: MoviesCarouselDelegate {
    func didSelect(movie: Movie) {
        let controller = DetailViewController(id: movie.id)
        navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: - TableView
extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let statusBarHeight = UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        let navigationBarHeight = navigationController?.navigationBar.frame.height ?? 0
        
        let offset = scrollView.contentOffset.y + statusBarHeight + navigationBarHeight
        let normalizedAlpha = min(max((offset/100 * 3), 0), 1)
        navigationBlur.alpha = normalizedAlpha
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return DetailTableViewSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let type = DetailTableViewSection(rawValue: section),  type == .recomendations else { return nil }
        return CarouselHeaderView(title: "Recomendados", font: .systemFont(ofSize: 18, weight: .semibold), reuseIdentifier: CarouselHeaderView.description())
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let type = DetailTableViewSection(rawValue: section),  type == .recomendations else { return .leastNonzeroMagnitude }
        return DetailStyle.carouselHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = DetailTableViewSection(rawValue: indexPath.section) else { return UITableViewCell() }
        switch section {
        case .poster:
            let cell = tableView.dequeueReusableCell(withIdentifier: PosterTableViewCell.description()) as! PosterTableViewCell
            cell.movie = viewModel.movie
            return cell
            
        case .metadata:
            let cell = tableView.dequeueReusableCell(withIdentifier: MetadataTableViewCell.description()) as! MetadataTableViewCell
            cell.movie = viewModel.movie
            return cell
            
        case .keywords:
            let cell = tableView.dequeueReusableCell(withIdentifier: KeywordsTableViewCell.description()) as! KeywordsTableViewCell
            cell.keywords = viewModel.movie?.keywords ?? []
            return cell
            
        case .recomendations:
            let cell = tableView.dequeueReusableCell(withIdentifier: MoviesCarouselTableViewCell.description()) as! MoviesCarouselTableViewCell
            cell.movies = viewModel.movie?.recomendations ?? []
            cell.setupHeight(DetailStyle.carouselHeight, aspect: .portraitAspect)
            cell.delegate = self
            return cell
        }
    }
}
