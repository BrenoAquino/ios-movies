//
//  UIImageView+Kingfisher.swift
//  App
//
//  Created by Breno Aquino on 19/10/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {

    func estimatatedSize() -> CGSize {
        guard let width = widthConstraint()?.constant,
              let height = heightConstraint()?.constant,
              !translatesAutoresizingMaskIntoConstraints else {
                return frame.size
        }
        
        return CGSize(width: width, height: height)
    }
    
    func imageWithUrl(urlImage: String?, placeholder: UIImage? = nil, key: String? = nil, callback: ((Result<RetrieveImageResult, KingfisherError>) -> Void)? = nil) {
        layoutIfNeeded()
        if let urlImage = urlImage, let url = URL(string: urlImage) {
            let size = estimatatedSize()
            let resource: ImageResource = ImageResource(downloadURL: url, cacheKey: key)
            var options: KingfisherOptionsInfo = [.transition(.fade(0.25)), .scaleFactor(UIScreen.main.scale), .cacheOriginalImage]
            options.append(.processor(DownsamplingImageProcessor(size: size)))
            kf.setImage(with: resource, placeholder: placeholder, options: options) { result in
                switch result {
                case .success(let data):
                    callback?(.success(data))
                case .failure(let error):
                    callback?(.failure(error))
                }
            }
            return
        }
        image = placeholder
    }
}
