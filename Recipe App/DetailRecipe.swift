//
//  DetailRecipe.swift
//  Recipe App
//
//  Created by Habibur Rahman on 1/21/22.
//

import Foundation

struct DetailRecipe: Decodable {
    let recipes: [Details]
}

struct Details: Decodable {
    let imageUrl: String
    let socialUrl: Double
    let publisher: String
    let sourceUrl: String
    let id: String
    let publishedId: String
    let title: String
}




