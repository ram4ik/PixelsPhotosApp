//
//  Photo.swift
//  PixelsPhotosApp
//
//  Created by ramil on 11.03.2021.
//

import Foundation

struct Photo: Codable {
    var id: Int
    var photographer: String
    var photographer_url: String
    var photographer_tag: String {
        return photographer_url.replacingOccurrences(of: "https://www.pexels.com/", with: "")
    }
    var src: PhotoSize
}
