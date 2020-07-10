//
//  HomeViewController.swift
//  App
//
//  Created by Breno Aquino on 25/09/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let viewModel: HomeViewModel = HomeViewModel()
    
    // MARK: - Layout Vars
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CarouselHeaderView.self, forHeaderFooterViewReuseIdentifier: CarouselHeaderView.description())
        tableView.register(UpcomingTableViewCell.self, forCellReuseIdentifier: UpcomingTableViewCell.description())
        tableView.register(MoviesCarouselTableViewCell.self, forCellReuseIdentifier: MoviesCarouselTableViewCell.description())
        tableView.backgroundColor = .black
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.contentInset = .zero
        return tableView
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupSuccessCallback()
        setupFailureCallback()
        
        viewModel.home()
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
    // MARK: Layout
    private func setupLayout() {
        view.backgroundColor = .primaryBackgorund
        view.addSubview(tableView)
        view.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        tableView
            .top(anchor: view.topAnchor)
            .leading(anchor: view.leadingAnchor)
            .trailing(anchor: view.trailingAnchor)
            .bottom(anchor: view.bottomAnchor)
    }
    
    // MARK: States
    private func setupSuccessCallback() {
        viewModel.onHomeSucess = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    private func setupFailureCallback() {
        viewModel.onFailure = { error in
            print(error.localizedDescription)
        }
    }
}

// MARK: - Movie Selection
extension HomeViewController: MoviesCarouselDelegate {
    func didSelect(movie: Movie) {
        let controller = DetailViewController(id: movie.id)
        navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: - TableView
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.contents.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard section != 0 else { return .leastNonzeroMagnitude }
        return HomeStyle.carouselHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return HomeStyle.movieSpacing
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard indexPath.section != 0 else { return UIScreen.main.bounds.width / .landscapeAspect }
        return HomeStyle.carouselHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section != 0 else { return nil }
        let genre = viewModel.contents[section].genre
        let view = CarouselHeaderView(title: genre.name, reuseIdentifier: CarouselHeaderView.description())
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: UpcomingTableViewCell.description(), for: indexPath) as! UpcomingTableViewCell
            cell.movies = viewModel.contents[indexPath.section].movies
            cell.delegate = self
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: MoviesCarouselTableViewCell.description(), for: indexPath) as! MoviesCarouselTableViewCell
            cell.movies = viewModel.contents[indexPath.section].movies
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? UpcomingTableViewCell else { return }
        cell.setupTimer()
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? UpcomingTableViewCell else { return }
        cell.stopTimer()
    }
}
