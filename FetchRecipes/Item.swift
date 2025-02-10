//
//  Item.swift
//  FetchRecipes
//
//  Created by Andrew Kinnie on 2/10/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
