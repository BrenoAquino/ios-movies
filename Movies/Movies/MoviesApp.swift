//
//  MoviesApp.swift
//  Movies
//
//  Created by Breno Aquino on 14/09/22.
//

import SwiftUI
import DesignSystem

@main
struct MoviesApp: App {
    
    init() {
        setupImages()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// MARK: DesignSystem
extension MoviesApp {
    private func setupImages() {
        ImageCacheManager.shared.preProcessor = { image in
            "https://image.tmdb.org/t/p/original" + image
        }
    }
}
