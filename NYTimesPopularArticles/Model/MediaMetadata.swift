//
//  ArticleMockData.swift
//  NYTimesPopularArticles
//
//  Created by Saqlain Bhatti on 28/07/2024.
//

import Foundation

struct MediaMetadata : Decodable {
	let url : String?
    
    init(url: String?) {
        self.url = url
    }
}
