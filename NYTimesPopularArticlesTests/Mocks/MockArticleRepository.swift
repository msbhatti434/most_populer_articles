//
//  MockArticleRepository.swift
//  NYTimesPopularArticlesTests
//
//  Created by Saqlain Bhatti on 29/07/2024.
//

import Foundation

class MockArticleRepository {
    var shouldReturnError = false
    var mockArticles: [Article] = []
}

extension MockArticleRepository: ArticleRepositoryProtocol {
    func fetchMostPopularArticles(section: String = "all-sections", period: Int = 7) async throws -> [Article] {
        if shouldReturnError {
            throw NSError(domain: "MockError", code: 1, userInfo: nil)
        }
        return mockArticles
    }
}

class MockArticleRepository1: ArticleRepositoryProtocol {
    var returnError = false
    var mockArticles:[Article] = []
    func fetchMostPopularArticles(section: String, period: Int) async throws -> [Article] {
        if returnError {
            throw NSError(domain: "MockError", code: 1, userInfo: nil)
        }
        return mockArticles
    }
    
    
}
