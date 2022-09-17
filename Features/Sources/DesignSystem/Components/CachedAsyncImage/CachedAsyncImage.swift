//
//  CachedAsyncImage.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import SwiftUI

public struct CachedAsyncImage<Content, Placeholder>: View where Content: View, Placeholder: View {
    
    private let url: URL?
    private let transaction: Transaction
    @ViewBuilder private let content: (Image) -> Content
    @ViewBuilder private let placeholder: () -> Placeholder
    
    public init(
        image: String,
        transaction: Transaction = Transaction(animation: .linear(duration: 0.3)),
        @ViewBuilder placeholder: @escaping () -> Placeholder,
        @ViewBuilder content: @escaping (Image) -> Content
    ) {
        let urlProcessed = ImageCacheManager.shared.preProcessor(image)
        self.url = URL(string: urlProcessed)
        self.transaction = transaction
        self.content = content
        self.placeholder = placeholder
    }
    
    public var body: some View {
        if let url = url, let image = ImageCacheManager.shared.cache[url] {
            content(image)
        } else {
            AsyncImage(url: url, transaction: transaction) { phase in
                switch phase {
                case .success(let image):
                    handleImage(image)
                case .failure, .empty:
                    placeholder()
                @unknown default:
                    fatalError()
                }
            }
        }
    }
    
    private func handleImage(_ image: Image) -> some View {
        if let url = url?.absoluteString {
            ImageCacheManager.shared.cache[url] = image
        }
        return content(image)
    }
}
