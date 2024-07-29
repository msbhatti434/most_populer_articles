//
//  SampleData.swift
//  NYTimesPopularArticlesTests
//
//  Created by Saqlain Bhatti on 29/07/2024.
//

import Foundation

extension Article {
    static let sampleArticle = Article(
        id: 1,
        url: "https://www.nytimes.com/2024/07/27/sample-article.html",
        publishedDate: "2024-07-27",
        byline: "By Jane Doe",
        title: "Sample Article Title",
        abstract: "This is a sample abstract for the article.",
        media: [Media(mediaMetadata: [MediaMetadata(url: "https://www.nytimes.com/sample-image.jpg")])]
    )
}
