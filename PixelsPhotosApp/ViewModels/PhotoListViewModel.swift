//
//  PhotoListViewModel.swift
//  PixelsPhotosApp
//
//  Created by ramil on 11.03.2021.
//

import UIKit

protocol PhotoListViewModelDelegate: class {
    func photoLoaded()
}

final class PhotoListViewModel {
    private var photos = [Photo]()
    
    weak var delegate: PhotoListViewModelDelegate?
    
    private let pexelsClient: PexelsClient
    
    var currentPage = 0
    
    init() {
        pexelsClient = PexelsClient()
        loadPhotos()
    }
    
    var count: Int {
        return photos.count
    }
    
    func getPhoto(at idx: Int) -> Photo {
        return photos[idx]
    }
    
    func loadPhotos() {
        currentPage += 1
        let feed = PhotoFeed.curated(currentPage: currentPage, perPage: 20)
        pexelsClient.getPhotos(from: feed) { [weak self] (result) in
            guard let strongSelf = self else { return }
            
            switch result {
            case .success(let photoFeedResult):
                guard let photoResult = photoFeedResult else {
                    return
                }
                strongSelf.photos.append(contentsOf: photoResult.photos)
                strongSelf.delegate?.photoLoaded()
                
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
