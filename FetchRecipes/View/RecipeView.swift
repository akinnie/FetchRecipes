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
            if let photoURL = URL(string: recipe.photoURLSmall ?? "") {
                LoadingImage(url: photoURL)
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .background(Color.gray.tertiary)
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
