//
//  APIError.swift
//  NYTimesPopularArticles
//
//  Created by Saqlain Bhatti on 28/07/2024.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingFailed(Error)
    case invalidRequestWithMessage(String)
}
