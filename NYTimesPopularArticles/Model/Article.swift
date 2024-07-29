//
//  ArticleMockData.swift
//  NYTimesPopularArticles
//
//  Created by Saqlain Bhatti on 28/07/2024.
//

import Foundation

struct Article : Decodable {
    
    let id : Int?
	let url : String?
	let publishedDate : String?
	let byline : String?
	let title : String?
	let abstract : String?
	let media : [Media]?

	enum CodingKeys: String, CodingKey {

        case id = "id"
		case url = "url"
		case publishedDate = "published_date"
		case byline = "byline"
		case type = "type"
		case title = "title"
		case abstract = "abstract"
		case media = "media"
		
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
		url = try values.decodeIfPresent(String.self, forKey: .url)
        publishedDate = try values.decodeIfPresent(String.self, forKey: .publishedDate)
		byline = try values.decodeIfPresent(String.self, forKey: .byline)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		abstract = try values.decodeIfPresent(String.self, forKey: .abstract)
		media = try values.decodeIfPresent([Media].self, forKey: .media)
	}
    
    init(id: Int?, url: String?, publishedDate: String?, byline: String?, title: String?, abstract: String?, media: [Media]?) {
        self.id = id
        self.url = url
        self.publishedDate = publishedDate
        self.byline = byline
        self.title = title
        self.abstract = abstract
        self.media = media
    }

}

extension Article: Identifiable{
    
}
