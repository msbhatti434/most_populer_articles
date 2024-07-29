//
//  ArticleRepository.swift
//  NYTimesPopularArticles
//
//  Created by Saqlain Bhatti on 27/07/2024.
//

import Foundation

class ArticleRepository: ArticleRepositoryProtocol {
    private let apiService: APIServiceProtocol
    private let configurationManager: ConfigurationManagerProtocol
    
    init(apiService: APIServiceProtocol, configurationManager: ConfigurationManagerProtocol) {
        self.apiService = apiService
        self.configurationManager = configurationManager
    }
    
    func fetchMostPopularArticles(section: String = "all-sections", period: Int = 7) async throws -> [Article] {
            let apiKey = configurationManager.getAPIKey()
            let endpoint = RequestBuilder(
                path: "\(APIEndpoints.mostViewedBase.rawValue)/\(section)/\(period).json",
                method: .GET,
                queryParameters: nil,
                headers: nil,
                body: nil,
                apiKey: apiKey
            )
            
            let response: ArticlesResponse = try await apiService.request(endpoint)
            
            guard let articles = response.results else {
                throw NSError(domain: "com.domain.app", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch articles"])
            }
            
            return articles
        }
}

