//
//  ArticleListView.swift
//  NYTimesPopularArticles
//
//  Created by Saqlain Bhatti on 27/07/2024.
//

import SwiftUI

struct ArticleListView: View {
    @StateObject private var viewModel: ArticleViewModel
    
    init(viewModel: ArticleViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
            } else {
                List(viewModel.articles) { article in
                    ZStack {
                        ArticleRow(article: article)
                            .padding(.vertical, 4)
                            .listRowInsets(EdgeInsets())
                        
                        NavigationLink(destination: ArticleDetailView(article: article)) {
                            EmptyView()
                        }
                        .buttonStyle(PlainButtonStyle()) 
                        .frame(width: 0, height: 0)
                        .opacity(0)
                    }
                }
                .listStyle(PlainListStyle()) // Use plain list style
                .padding(.horizontal, 8)
            }
        }
        .onAppear {
            viewModel.fetchMostPopularArticles()
        }
    }
}

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        let configurationManager = AppConfig()
        let apiService = APIService(baseURL: URL(string: "https://api.nytimes.com/")!, configurationManager: configurationManager)
        let repository = ArticleRepository(apiService: apiService, configurationManager: configurationManager)
        let viewModel = ArticleViewModel(repository: repository)
        ArticleListView(viewModel: viewModel)
    }
}
