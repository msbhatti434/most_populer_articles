//
//  MockAPIService.swift
//  NYTimesPopularArticlesTests
//
//  Created by Saqlain Bhatti on 29/07/2024.
//

import Foundation

class MockAPIService: APIServiceProtocol {
    var shouldReturnError = false
    var mockResponse: ArticlesResponse?

    func request<T>(_ endpoint: RequestBuilder) async throws -> T where T: Decodable {
        if shouldReturnError {
            throw NSError(domain: "MockError", code: 1, userInfo: nil)
        }
        guard let response = mockResponse as? T else {
            throw NSError(domain: "MockError", code: 1, userInfo: nil)
        }
        return response
    }
}
