//
//  CachedImageViewModel.swift
//  FetchRecipes
//
//  Created by Andrew Kinnie on 2/15/25.
//

import SwiftUI

class CachedImageLoader: ObservableObject {
    @Published var state: CachedImageState?

    func image(from url: URL) async throws -> Data {
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }

    @MainActor
    func load(urlString: String, cache: ImageCacheProtocol = ImageCache.shared) async {
        state = .loading

        if let data = cache.image(for: urlString) {
            state = .finished(data)
            return
        }
        
        do {
            guard let url = URL(string: urlString) else {
                state = .failed(ImageCacheError.urlInvalid)
                return
            }
            let data = try await image(from: url)
            cache.storeImage(data: data, forUrl: urlString)
            state = .finished(data)
        } catch {
            state = .failed(error)
        }
    }
}

enum CachedImageState {
    case loading
    case finished(Data)
    case failed(Error)
}
