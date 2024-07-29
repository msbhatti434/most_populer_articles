//
//  ArticleMockData.swift
//  NYTimesPopularArticles
//
//  Created by Saqlain Bhatti on 28/07/2024.
//

import Foundation

struct SampleData {
    static let articles: [Article] = [
        Article(
            id: 1,
            url: "https://example.com/article1",
            publishedDate: "2024-07-27",
            byline: "By Sample Author 1",
            title: "Sample Article 1",
            abstract: "This is a sample article 1.",
            media: [
                Media(mediaMetadata: [
                    MediaMetadata(url: "https://via.placeholder.com/150")
                ])
            ]
        ),
        Article(
            id: 2,
            url: "https://example.com/article2",
            publishedDate: "2024-07-26",
            byline: "By Sample Author 2",
            title: "Sample Article 2",
            abstract: "This is a sample article 2.",
            media: [
                Media(mediaMetadata: [
                    MediaMetadata(url: "https://via.placeholder.com/150")
                ])
            ]
        )
    ]
}

class MockArticleRepository: ArticleRepositoryProtocol {
    func fetchMostPopularArticles(section: String, period: Int) async throws -> [Article] {
        return SampleData.articles
    }
}


