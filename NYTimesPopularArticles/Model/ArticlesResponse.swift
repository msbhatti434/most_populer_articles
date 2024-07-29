//
//  ArticleMockData.swift
//  NYTimesPopularArticles
//
//  Created by Saqlain Bhatti on 28/07/2024.
//

import Foundation
struct ArticlesResponse : Decodable {
	let results : [Article]?
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try values.decodeIfPresent([Article].self, forKey: .results)
    }
    init(results: [Article]) {
        self.results = results
    }

}
