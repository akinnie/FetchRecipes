//
//  PreviewData.swift
//  FetchRecipes
//
//  Created by Andrew Kinnie on 2/12/25.
//

extension Recipe {
    static let previewData: [Recipe] = {
        let jsonData = """
[
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
""".data(using: .utf8)
        guard let recipes = try? NetworkManager().decodeRecipesFromData(jsonData) else { return [] }
        return recipes
    }()

    static var singleRecipePreviewData: Recipe {
        Recipe(id: "test", cuisine: "Ethiopian", name: "Sega Wat", photoURLLarge: nil, photoURLSmall: "https://i0.wp.com/mealsbymavis.com/wp-content/uploads/2020/03/kai-sega-wot_1-scaled.jpg?fit=1080%2C720&ssl=1", sourceUrl: "https://mealsbymavis.com/kai-sega-wat-spicy-ethiopian-beef-stew/", youtubeUrl: nil)
    }

    static var singleRecipeInvalidImagePreviewData: Recipe {
        Recipe(id: "test", cuisine: "Ethiopian", name: "Sega Wat", photoURLLarge: nil, photoURLSmall: "https://not.a.valid.url", sourceUrl: "https://mealsbymavis.com/kai-sega-wat-spicy-ethiopian-beef-stew/", youtubeUrl: nil)
    }
}
