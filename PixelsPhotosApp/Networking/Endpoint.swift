//
//  Endpoint.swift
//  PixelsPhotosApp
//
//  Created by ramil on 11.03.2021.
//

import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String { get }
    var query: String { get }
}

extension Endpoint {
    var authHeader: String {
        return API.key
    }
    
    var urlComponenets: URLComponents {
        var componenets = URLComponents(string: base) ?? URLComponents()
        componenets.path = path
        componenets.query = query
        return componenets
    }
    
    var request: URLRequest {
        let url = urlComponenets.url ?? URL(string: "https://www.google.com")!
        var request = URLRequest(url: url)
        request.setValue(authHeader, forHTTPHeaderField: "Authorization")
        return request
    }
}
