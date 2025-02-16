//
//  RecipeView.swift
//  FetchRecipes
//
//  Created by Andrew Kinnie on 2/14/25.
//

import SwiftUI

struct RecipeView: View {
    let recipe: Recipe

    var body: some View {
        HStack {
            if let url = recipe.photoURLSmall {
                CachedAsyncImage(url: url) { phase in
                    switch phase {
                    case .failure:
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundStyle(.gray)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                            .background(Color.gray.tertiary)
                    default:
                        ProgressView()
                            .frame(width: 80, height: 80)
                    }
                }
            }
            VStack(alignment: .leading) {
                Group {
                    Text(recipe.name)
                        .font(.headline)
                    Text(recipe.cuisine)
                        .font(.caption)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    List {
        RecipeView(recipe: .singleRecipePreviewData)
    }
}

#Preview("Bad Image") {
    List {
        RecipeView(recipe: .singleRecipeInvalidImagePreviewData)
    }
}
