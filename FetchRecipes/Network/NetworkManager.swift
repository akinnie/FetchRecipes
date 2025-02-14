//
//  NetworkManager.swift
//  FetchRecipes
//
//  Created by Andrew Kinnie on 2/10/25.
//

import Foundation

//protocol NetworkManagerProtocol {
//    var recipesData: (String) async throws -> Data? { get }
//    var decodeRecipesFromData: (Data?) throws -> [Recipe]? { get }
//}

class NetworkManager {
    static let shared = NetworkManager()
    static let urlString = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
    static let malformedDataUrlString = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"

    var recipesData: (String) async throws -> Data? = { urlString in
        guard let url = URL(string: urlString) else { return nil }
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
    
    var decodeRecipesFromData: (Data?) throws -> [Recipe]? = { data in
        guard let data else {
            return nil
        }

        let decoder = JSONDecoder()
        let recipesRoot = try decoder.decode(RecipeResponse.self, from: data)
        return recipesRoot.recipes
    }
}
