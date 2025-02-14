//
//  LoadingImage.swift
//  FetchRecipes
//
//  Created by Andrew Kinnie on 2/14/25.
//

import SwiftUI

struct LoadingImage: View {
    let url: URL

    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView()
                .frame(maxWidth: .infinity)
        }
    }
}
