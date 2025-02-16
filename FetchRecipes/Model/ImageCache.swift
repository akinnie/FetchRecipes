//
//  ImageCache.swift
//  FetchRecipes
//
//  Created by Andrew Kinnie on 2/15/25.
//

import Foundation

enum ImageCacheError: Error {
    case imageNotFound
    case urlInvalid
    case invalidData
}

protocol ImageCacheProtocol {
    func storeImage(data: Data, forUrl urlString: String)
    func image(for urlString: String) -> Data?
    func clearCache()
}

class ImageCache: ImageCacheProtocol {
    static let shared = ImageCache()
    private init() {}

    lazy var cache: NSCache = {
        let cache = NSCache<NSString, NSData>()
        cache.countLimit = 200
        cache.countLimit = 25 * 1024 * 1024
        return cache
    }()
    
    func storeImage(data: Data, forUrl urlString: String) {
        cache.setObject(data as NSData, forKey: NSString(string: urlString))
    }
    
    func image(for urlString: String) -> Data? {
        guard let cachedData = cache.object(forKey: NSString(string: urlString)) as Data? else {
            return nil
        }
        return cachedData
    }
    
    func clearCache() {
        cache.removeAllObjects()
    }
}
