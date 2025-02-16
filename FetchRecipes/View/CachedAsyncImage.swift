//
//  CachedAsyncImage.swift
//  FetchRecipes
//
//  Created by Andrew Kinnie on 2/15/25.
//

import SwiftUI

struct CachedAsyncImage<Content: View>: View {
    var url: String

    @StateObject var imageLoader = CachedImageLoader()
    @ViewBuilder let content: (AsyncImagePhase) -> Content

    var body: some View {
        ZStack {
            switch imageLoader.state {
            case .loading:
                content(.empty)
            case .failed(let error):
                content(.failure(error))
            case .finished(let data):
                if let image = UIImage(data: data) {
                    content(.success(Image(uiImage: image)))
                } else {
                    content(.failure(ImageCacheError.invalidData))
                }
            default:
                content(.empty)
            }
        }
        .task {
            await imageLoader.load(urlString: url)
        }
    }
}

#Preview {
    CachedAsyncImage(url: Recipe.singleRecipePreviewData.photoURLSmall ?? "") { phase in
        switch phase {
        case .empty:
            Text("Loading...")
        case .success(let image):
            image
        case .failure:
            Text("Error loading image")
        default:
            Text("Error unexpected phase")
        }
    }
}
