//
//  RecipeDescription.swift
//  Recipe App
//
//  Created by Walid Hossain on 21/1/22.
//

import Foundation


struct RecipeDescription: Decodable {
    let recipe: Recipes
    
    
}

struct Recipes: Decodable {
    
        let imageUrl: String
        let socialUrl: Double
        let publisher: String
        let sourceUrl: String
        let id: String
        let publishedId: String
        let title: String
        let ingredients: [String]
    

}
