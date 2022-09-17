//
//  CacheImageManager.swift
//  
//
//  Created by Breno Aquino on 17/09/22.
//

import Foundation
import SwiftUI

public class ImageCacheManager {
    public static let shared: ImageCacheManager = ImageCacheManager()
    
    // MARK: Cache
    var cache: Cache = .init()
    
    // MARK: PreProcessor
    public var preProcessor: ((String) -> String) = { $0 }
    
    private init() {}
}

// MARK: - Cache Struct
extension ImageCacheManager {
    struct Cache {
        private var images: [String : Image] = [:]
        
        fileprivate init() {}
        
        subscript(url: String) -> Image? {
            get { images[url] }
            set { images[url] = newValue }
        }
        
        subscript(url: URL) -> Image? {
            get { images[url.absoluteString] }
            set { images[url.absoluteString] = newValue }
        }
    }
}
