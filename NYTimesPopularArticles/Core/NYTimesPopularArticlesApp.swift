//
//  NYTimesPopularArticlesApp.swift
//  NYTimesPopularArticles
//
//  Created by Saqlain Bhatti on 27/07/2024.
//

import SwiftUI

@main
struct NYTimesPopularArticlesApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                let configurationManager = AppConfig()
                let apiService = APIService(baseURL: URL(string: "https://api.nytimes.com/")!, configurationManager: configurationManager)
                let repository = ArticleRepository(apiService: apiService, configurationManager: configurationManager)
                let viewModel = ArticleViewModel(repository: repository)
                ArticleListView(viewModel: viewModel)
                    .navigationTitle("NY Times Most Popular")
            }
        }
    }
}
