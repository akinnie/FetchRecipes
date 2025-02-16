//
//  RecipeViewModel.swift
//  FetchRecipes
//
//  Created by Andrew Kinnie on 2/13/25.
//

import SwiftUI

@Observable class RecipeListViewModel {
    let networkManager: NetworkManager
    private(set) var recipes: [Recipe] = []
    private(set) var isLoading = false

    init() {
        networkManager = NetworkManager.shared
    }

    @MainActor func retrieveRecipes() async throws {
        guard !isLoading else { return }
        defer { isLoading = false }
        isLoading = true
        let data = try await networkManager.recipesData(NetworkManager.urlString)
        recipes = try networkManager.decodeRecipesFromData(data) ?? []
    }
}
