//
//  ContentView.swift
//  FetchRecipes
//
//  Created by Andrew Kinnie on 2/10/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var recipes: [Recipe]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(recipes) { recipe in
                    NavigationLink {
                        Text("Recipe at \(recipe.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(recipe.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteRecipes)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addRecipe) {
                        Label("Add Recipe", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select a recipe")
        }
    }

    private func addRecipe() {
        withAnimation {
            let newRecipe = Recipe(timestamp: Date())
            modelContext.insert(newRecipe)
        }
    }

    private func deleteRecipes(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(recipes[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Recipe.self, inMemory: true)
}
