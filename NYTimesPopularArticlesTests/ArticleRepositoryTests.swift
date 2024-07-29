//
//  ArticleRepositoryTests.swift
//  NYTimesPopularArticlesTests
//
//  Created by Saqlain Bhatti on 29/07/2024.
//

import XCTest

@testable import NYTimesPopularArticles

class ArticleRepositoryTests: XCTestCase {
    var repository: ArticleRepository!
    var apiService: MockAPIService!
    var configurationManager: AppConfig!

    override func setUp() {
        super.setUp()
        apiService = MockAPIService()
        configurationManager = AppConfig()
        repository = ArticleRepository(apiService: apiService, configurationManager: configurationManager)
    }

    override func tearDown() {
        repository = nil
        apiService = nil
        configurationManager = nil
        super.tearDown()
    }

    func testFetchMostPopularArticlesSuccess() async {
        apiService.mockResponse = ArticlesResponse(results: [Article.sampleArticle])
        do {
            let articles = try await repository.fetchMostPopularArticles()
            XCTAssertNotNil(articles, "Expected non-nil articles")
            XCTAssertEqual(articles.count, 1, "Expected one article")
        } catch {
            XCTFail("Expected success but got error: \(error)")
        }
    }

    func testFetchMostPopularArticlesFailure() async {
        apiService.shouldReturnError = true
        do {
            _ = try await repository.fetchMostPopularArticles()
            XCTFail("Expected failure but got success")
        } catch {
            XCTAssertNotNil(error, "Expected error but got nil")
        }
    }
}
