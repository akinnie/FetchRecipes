//
//  NetworkManager.swift
//  FetchRecipes
//
//  Created by Andrew Kinnie on 2/10/25.
//

import Foundation

class NetworkManager {
    var decodeRecipesFromData: (Data?) throws -> [RecipeDTO]? = { data in
        guard let data else {
            return nil
        }

        let decoder = JSONDecoder()
        let recipesRoot = try decoder.decode(RecipeResponse.self, from: data)
        return recipesRoot.recipes
    }
}
