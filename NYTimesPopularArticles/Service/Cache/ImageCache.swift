//
//  ImageCache.swift
//  NYTimesPopularArticles
//
//  Created by Saqlain Bhatti on 27/07/2024.
//

import UIKit

protocol ImageCacheProtocol {
    func getImage(forKey key: String) -> UIImage?
    func setImage(_ image: UIImage, forKey key: String)
}

class ImageCache: ImageCacheProtocol {
    private let cache = NSCache<NSString, UIImage>()
    
    func getImage(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
}

