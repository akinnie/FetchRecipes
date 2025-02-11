//
//  RecipeDTO.swift
//  FetchRecipes
//
//  Created by Andrew Kinnie on 2/10/25.
//

struct RecipeDTO : Decodable {
    let uuid: String
    let cuisine: String
    let name: String
    let photoURLLarge: String?
    let photoURLSmall: String?
    let sourceUrl: String?
    let youtubeUrl: String?

    enum CodingKeys: String, CodingKey {
        case uuid
        case cuisine
        case name
        case photoURLLarge = "photo_url_large"
        case photoURLSmall = "photo_url_small"
        case sourceUrl = "source_url"
        case youtubeUrl = "youtube_url"
    }
}
