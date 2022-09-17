//
//  File.swift
//  
//
//  Created by Breno Aquino on 15/09/22.
//

import Foundation
import Combine
import Domain

public final class DetailViewModel: ObservableObject {
    
    private let contentId: Int
    private let useCase: DetailUseCase
    
    private var cancellables: Set<AnyCancellable> = .init()
    
    // MARK: Publishers
    @Published private(set) var movie: MovieUI?
    
    // MARK: Inits
    public init(useCase: DetailUseCase, contentId: Int) {
        self.useCase = useCase
        self.contentId = contentId
    }
}

// MARK: - Flows
extension DetailViewModel {
    func fetchData() {
        useCase
            .detail(id: contentId)
            .sink(receiveCompletion: { completion in
                
            }, receiveValue: { [weak self] movie in
                self?.movie = MovieUI(movie: movie)
            })
            .store(in: &cancellables)
    }
}
