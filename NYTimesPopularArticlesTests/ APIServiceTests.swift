//
//   APIServiceTests.swift
//  NYTimesPopularArticlesTests
//
//  Created by Saqlain Bhatti on 29/07/2024.
//

import XCTest
@testable import NYTimesPopularArticles

class APIServiceTests: XCTestCase {
    var apiService: APIService!
    var configurationManager: AppConfig!

    override func setUp() {
        super.setUp()
        configurationManager = AppConfig()
        apiService = APIService(baseURL: URL(string: "https://api.nytimes.com/")!, configurationManager: configurationManager)
    }

    override func tearDown() {
        apiService = nil
        configurationManager = nil
        super.tearDown()
    }

    func testFetchMostPopularArticlesSuccess() async {
        do {
            let endpoint = RequestBuilder(
                path: "svc/mostpopular/v2/mostviewed/all-sections/7.json",
                method: HTTPMethod.GET,
            apiKey: configurationManager.getAPIKey())

            let response: ArticlesResponse = try await apiService.request(endpoint)
            XCTAssertNotNil(response.results, "Expected non-nil results")
        } catch {
            XCTFail("Expected success but got error: \(error)")
        }
    }

    func testFetchMostPopularArticlesFailure() async {
        let invalidApiService = APIService(baseURL: URL(string: "https://invalidurl.com/")!, configurationManager: configurationManager)
        do {
            let endpoint = RequestBuilder(
                path: "svc/mostpopular/v2/mostviewed/all-sections/7.json",
                method: HTTPMethod.GET,
            apiKey: configurationManager.getAPIKey())
            
        _ = try await invalidApiService.request(endpoint) as Data
            XCTFail("Expected failure but got success")
        } catch {
            XCTAssertNotNil(error, "Expected error but got nil")
        }
    }
}
