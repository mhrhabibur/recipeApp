//
//  Recipe.swift
//  Recipe App
//
//  Created by Habibur Rahman on 1/20/22.
//

import Foundation

struct Recipe: Decodable {
    let categories: [RecipeCategories]
}

struct RecipeCategories: Decodable {
    let imageUrl: String
    let title: String
}
