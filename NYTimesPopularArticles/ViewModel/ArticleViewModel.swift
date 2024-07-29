//
//  ArticleViewModel.swift
//  NYTimesPopularArticles
//
//  Created by Saqlain Bhatti on 27/07/2024.
//

import SwiftUI
@MainActor
class ArticleViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let repository: ArticleRepository

    init(repository: ArticleRepository) {
        self.repository = repository
    }

    func fetchMostPopularArticles(section: String = "all-sections", period: Int = 7) {
        Task {
            do {
                isLoading = true
                articles = try await repository.fetchMostPopularArticles(section: section, period: period)
                isLoading = false
            } catch {
                isLoading = false
                errorMessage = error.localizedDescription
            }
        }
    }
}
