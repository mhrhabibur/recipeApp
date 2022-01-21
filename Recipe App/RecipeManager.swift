//
//  RecipeManager.swift
//  Recipe App
//
//  Created by Habibur Rahman on 1/20/22.
//

import Foundation
import UIKit


class RecipeManager {
    
  
    
    let url = URL(string: "https://recipesapi.herokuapp.com/api/v2/categories")!
    
    func fetchData(completion: @escaping (Recipe?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let recipes = try? JSONDecoder().decode(Recipe.self, from: data) {
                    completion(recipes, nil)
                    //print(recipes.categories[3].title)
                    return
                    
                    
                   
                }
            }
            completion(nil, error)
        }.resume()
    }
   
}
