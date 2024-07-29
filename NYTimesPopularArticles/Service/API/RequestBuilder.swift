//
//  Endpoint.swift
//  NYTimesPopularArticles
//
//  Created by Saqlain Bhatti on 28/07/2024.
//

import Foundation

struct RequestBuilder {
    let path: String
    let method: HTTPMethod
    let queryParameters: [String: String]?
    let headers: [String: String]?
    let body: Data?
    
    init(path: String, method: HTTPMethod, queryParameters: [String: String]? = nil, headers: [String: String]? = nil, body: Data? = nil, apiKey: String?) {
        self.path = path
        self.method = method
        
        var allQueryParameters = queryParameters ?? [:]
        if let apiKey = apiKey {
            allQueryParameters["api-key"] = apiKey
        }
        self.queryParameters = allQueryParameters
        
        self.headers = headers
        self.body = body
    }
}
