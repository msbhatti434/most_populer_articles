//
//  AppConfig.swift
//  NYTimesPopularArticles
//
//  Created by Saqlain Bhatti on 28/07/2024.
//

import Foundation

class AppConfig: ConfigurationManagerProtocol {
    private var apiKey: String?{
        guard let filePath = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
              let plist = NSDictionary(contentsOfFile: filePath),
              let key = plist.object(forKey: "NYT_API_KEY") as? String else {
            return nil
        }
        return key
    }
    
    func getAPIKey() -> String? {
        return apiKey
    }
}

// MARK:- Design inspirations - https://www.figma.com/proto/OvZEgVs6gWIXphnz46XcoG/News-App-UI-Kit-(Community)?node-id=89-10&t=aGEteuDuroOIe82D-0&scaling=min-zoom&content-scaling=fixed&page-id=89%3A1
