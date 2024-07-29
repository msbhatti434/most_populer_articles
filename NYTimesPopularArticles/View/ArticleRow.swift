//
//  ArticleRow.swift
//  NYTimesPopularArticles
//
//  Created by Saqlain Bhatti on 27/07/2024.
//
import SwiftUI

struct ArticleRow: View {
    let article: Article
    @StateObject private var imageLoader: ImageLoader

    init(article: Article) {
        self.article = article

        if let url = URL(string: article.media?.first?.mediaMetadata?.last?.url ?? "") {
            _imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
        } else {
            _imageLoader = StateObject(wrappedValue: ImageLoader(url: nil))
        }
    }

    var body: some View {
        ZStack {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 293)
                    .cornerRadius(8)
                    .clipped()
            } else {
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, minHeight: 293, maxHeight: 293)
                    .cornerRadius(8)
                    .clipped()
            }

            VStack {
                HStack {
                    Text(article.title ?? "")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding([.leading, .trailing, .top], 8)
                        .cornerRadius(4)
                    Spacer()
                }
                Spacer()
                HStack {
                    Text(article.byline ?? "")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding([.leading, .bottom], 8)

                        .cornerRadius(4)
                    Spacer()
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(.white)
                        Text(article.publishedDate ?? "")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    .padding([.trailing, .bottom], 8)
                    .cornerRadius(4)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 293)
        }
        .cornerRadius(8)
    }
}

#Preview {
    ArticleRow(article: SampleData.articles.last!)
}
