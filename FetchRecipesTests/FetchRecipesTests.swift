//
//  FetchRecipesTests.swift
//  FetchRecipesTests
//
//  Created by Andrew Kinnie on 2/10/25.
//

import Foundation
import Testing
@testable import FetchRecipes

struct FetchRecipesTests {
    let recipesValidData = """
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

    let recipesInvalidDataMissingRequiredFields = """
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
            "uuid": "another uuid"
        }
    ]
}
""".data(using: .utf8)
    
    @Test
    func recipeDTOIsCreatedWithValidData() throws {
        let sut = NetworkManager()

        let recipes = try sut.decodeRecipesFromData(recipesValidData)
        #expect(recipes != nil)
    }
    
    @Test
    func recipeDTOIsNotCreatedWithInvalidData() {
        let sut = NetworkManager()
        #expect(throws: DecodingError.self) {
            _ = try sut.decodeRecipesFromData(recipesInvalidDataMissingRequiredFields)
        }
    }
}
