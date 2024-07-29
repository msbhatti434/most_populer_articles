//
//  ArticleMockData.swift
//  NYTimesPopularArticles
//
//  Created by Saqlain Bhatti on 28/07/2024.
//

import Foundation

struct Media : Decodable {
	let mediaMetadata : [MediaMetadata]?

	enum CodingKeys: String, CodingKey {
		case mediaMetadata = "media-metadata"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        mediaMetadata = try values.decodeIfPresent([MediaMetadata].self, forKey: .mediaMetadata)
	}

    init(mediaMetadata: [MediaMetadata]?) {
        self.mediaMetadata = mediaMetadata
    }
}
