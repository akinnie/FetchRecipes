//
//  ContentView.swift
//  FetchRecipes
//
//  Created by Andrew Kinnie on 2/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel: RecipeListViewModel = RecipeListViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.recipes) { recipe in
                RecipeView(recipe: recipe)
            }
            .listRowInsets(.none)
            .listRowSpacing(4.0)
            .safeAreaPadding(.top)
            .task { try? await viewModel.retrieveRecipes() }
            .refreshable { try? await viewModel.retrieveRecipes()
            }
        }
    }
}

#Preview {
    ContentView()
}
