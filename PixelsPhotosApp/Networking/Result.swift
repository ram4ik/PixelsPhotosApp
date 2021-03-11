//
//  Result.swift
//  PixelsPhotosApp
//
//  Created by ramil on 11.03.2021.
//

import Foundation
 
enum Result<T, U> where U: Error {
    case success(T)
    case failure(U)
}
