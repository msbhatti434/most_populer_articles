//
//  ArticleRepositoryProtocol.swift
//  NYTimesPopularArticles
//
//  Created by Saqlain Bhatti on 28/07/2024.
//

import Foundation

protocol ArticleRepositoryProtocol {
    func fetchMostPopularArticles(section: String, period: Int) async throws -> [Article]
}
