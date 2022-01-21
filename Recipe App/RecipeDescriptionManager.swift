//
//  RecipeDescriptionManager.swift
//  Recipe App
//
//  Created by Walid Hossain on 21/1/22.
//

import Foundation


class RecipeDescriptionManagaer {
    
    func fetchData(recipeID: String, completion: @escaping (RecipeDescription?, Error?) -> Void) {
        let url = URL(string: "https://recipesapi.herokuapp.com/api/v2/recipes/\(recipeID)")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do{
                    let recipes = try JSONDecoder().decode(RecipeDescription.self, from: data)
                    completion(recipes,nil)
                } catch let DecodingError.typeMismatch(type, context){
                    print("\(type) \(context.debugDescription)")
                    completion(nil,error)
                } catch let DecodingError.valueNotFound(value, context){
                    print("\(value) \(context.debugDescription)")
                    completion(nil,error)
                } catch let DecodingError.keyNotFound(key, context){
                    print("\(key) \(context.debugDescription)")
                    completion(nil,error)
                } catch let e{
                    print("\(e.localizedDescription)")
                    completion(nil,e)
                }
            }
            completion(nil, error)
        }.resume()
    }
}
