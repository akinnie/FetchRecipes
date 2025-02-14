//
//  RecipeDTO.swift
//  FetchRecipes
//
//  Created by Andrew Kinnie on 2/10/25.
//

struct Recipe : Decodable, Identifiable {
    let id: String
    let cuisine: String
    let name: String
    let photoURLLarge: String?
    let photoURLSmall: String?
    let sourceUrl: String?
    let youtubeUrl: String?

    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case cuisine
        case name
        case photoURLLarge = "photo_url_large"
        case photoURLSmall = "photo_url_small"
        case sourceUrl = "source_url"
        case youtubeUrl = "youtube_url"
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.cuisine = try container.decode(String.self, forKey: .cuisine)
        self.name = try container.decode(String.self, forKey: .name)
        self.photoURLLarge = try container.decodeIfPresent(String.self, forKey: .photoURLLarge)
        self.photoURLSmall = try container.decodeIfPresent(String.self, forKey: .photoURLSmall)
        self.sourceUrl = try container.decodeIfPresent(String.self, forKey: .sourceUrl)
        self.youtubeUrl = try container.decodeIfPresent(String.self, forKey: .youtubeUrl)
    }

    init(id: String, cuisine: String, name: String, photoURLLarge: String? = nil, photoURLSmall: String? = nil, sourceUrl: String? = nil, youtubeUrl: String? = nil) {
        self.id = id
        self.cuisine = cuisine
        self.name = name
        self.photoURLLarge = photoURLLarge
        self.photoURLSmall = photoURLSmall
        self.sourceUrl = sourceUrl
        self.youtubeUrl = youtubeUrl
    }
}
