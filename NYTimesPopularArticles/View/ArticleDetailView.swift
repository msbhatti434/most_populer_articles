//
//  ArticleDetailView.swift
//  NYTimesPopularArticles
//
//  Created by Saqlain Bhatti on 27/07/2024.
//

import SwiftUI

struct ArticleDetailView: View {
    let article: Article
    
    var body: some View {
        
        WebView(url: "https://www.apple.com")
            .navigationTitle("Article Details")
    }
}


#Preview {
    ArticleDetailView(article: SampleData.articles.first!)
}
