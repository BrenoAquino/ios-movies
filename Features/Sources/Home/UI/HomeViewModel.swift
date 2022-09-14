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
    @Published private(set) var movies: [MovieUI] = []
    
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
                guard let upcoming = moviesByGenre[0] else { return }
                self?.movies = upcoming.map { MovieUI(movie: $0) }
            }
            .store(in: &cancellables)
    }
}
