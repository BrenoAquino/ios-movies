//
//  HomeViewModel.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Domain
import Combine
import DesignSystem

public final class HomeViewModel: ObservableObject {
    
    // MARK: - Proprieties
    private let homeUseCase: Domain.HomeUseCase
    private var cancellables: Set<AnyCancellable> = .init()
    
    // MARK: Publisher
    @Published private(set) var state: ViewState = .loading
    @Published private(set) var carousels: [CarouselUI] = []
    
    // MARK: - Inits
    public init(homeUseCase: Domain.HomeUseCase) {
        self.homeUseCase = homeUseCase
    }
}

// MARK: - Flow
extension HomeViewModel {
    func fetchData() {
        homeUseCase
            .moviesByGenre()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.state = .content
                case .failure:
                    self?.state = .failure
                }
            } receiveValue: { [weak self] moviesByGenre in
                for genreMovies in moviesByGenre {
                    let carousel = CarouselUI(genre: genreMovies.key, movies: genreMovies.value)
                    self?.carousels.append(carousel)
                }
                self?.carousels.sort(by: { $0.genre.id < $1.genre.id })
            }
            .store(in: &cancellables)
    }
}
