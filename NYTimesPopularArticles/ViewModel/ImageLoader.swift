//
//  ImageLoader.swift
//  NYTimesPopularArticles
//
//  Created by Saqlain Bhatti on 27/07/2024.
//

import UIKit

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    private let cache: ImageCacheProtocol
    private var url: URL?
    
    init(url: URL?, cache: ImageCacheProtocol = ImageCache()) {
        self.url = url
        self.cache = cache
        loadImage()
    }
    
    private func loadImage() {
        guard let url = url else {
            return
        }
        
        let cacheKey = url.absoluteString
        
        // Check if the image is already in cache
        if let cachedImage = cache.getImage(forKey: cacheKey) {
            self.image = cachedImage
            return
        }
        
        // Download the image if not in cache
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let downloadedImage = UIImage(data: data) {
                    cache.setImage(downloadedImage, forKey: cacheKey)
                    self.image = downloadedImage
                }
            } catch {
                print("Failed to load image from URL: \(error)")
            }
        }
    }
}

