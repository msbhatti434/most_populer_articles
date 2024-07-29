//
//  APIServiceProtocol.swift
//  NYTimesPopularArticles
//
//  Created by Saqlain Bhatti on 28/07/2024.
//

import Foundation

protocol APIServiceProtocol {
    func request<T: Decodable>(_ endpoint: RequestBuilder) async throws -> T
}
