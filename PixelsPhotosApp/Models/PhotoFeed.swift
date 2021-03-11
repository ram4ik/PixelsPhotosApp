//
//  PhotoFeed.swift
//  PixelsPhotosApp
//
//  Created by ramil on 11.03.2021.
//

import Foundation

enum PhotoFeed {
    case searchByCategory(category: String, perPage: Int)
    case curated(currentPage: Int, perPage: Int)
}

extension PhotoFeed: Endpoint {
    var base: String {
        return "https://api.pexels.com"
    }
    
    var path: String {
        switch self {
        case .searchByCategory:
            return "/v1/search"
        case .curated:
            return "/v1/curated"
        }
    }
    
    var query: String {
        switch self {
        case .searchByCategory(let category, let perPage):
            return "query=\(category)&per_page=\(perPage)"
        case .curated(let currentPage, let perPage):
            return "page=\(currentPage)&per_page=\(perPage)"
        }
    }
    
    
}
