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
        return blur
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
    }
    
    func setupStatus() {
        viewModel.onDetailSucess = { [weak self] in
            DispatchQueue.main.async {
                self?.backgropImage.imageWithUrl(urlImage: self?.viewModel.movie?.backdrop)
            }
        }
        
        viewModel.onFailure = { state in
            print(state)
        }
    }
}
