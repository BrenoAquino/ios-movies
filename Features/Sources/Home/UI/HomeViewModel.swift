//
//  HomeViewModel.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Domain
import Combine

public final class HomeViewModel: ObservableObject {
    
    // MARK: - Proprieties
    private let homeUseCase: Domain.HomeUseCase
    private var cancellables: Set<AnyCancellable> = .init()
    
    // MARK: Publisher
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
            .sink { completion in
                
            } receiveValue: { [weak self] moviesByGenre in
                for genreMovies in moviesByGenre {
                    let carousel = CarouselUI(genre: genreMovies.key, movies: genreMovies.value)
                    self?.carousels.append(carousel)
                }
            }
            .store(in: &cancellables)
    }
}
