//
//  PreviewData.swift
//  FetchRecipes
//
//  Created by Andrew Kinnie on 2/12/25.
//

extension RecipeDTO {
    static let previewData: [RecipeDTO] = {
        let jsonData = """
{
    "recipes": [
        {
            "cuisine": "British",
            "name": "Bakewell Tart",
            "photo_url_large": "https://some.url/large.jpg",
            "photo_url_small": "https://some.url/small.jpg",
            "uuid": "a valid uuid",
            "source_url": "https://some.url/index.html",
            "youtube_url": "https://www.youtube.com/watch?v=some.id"
        },
        {
            "cuisine": "Indian",
            "name": "Butter Chicken",
            "uuid": "another uuid"
        }
    ]
}
""".data(using: .utf8)
        guard let recipes = try? NetworkManager().decodeRecipesFromData(jsonData) else { return [] }
        return recipes
    }()
}
