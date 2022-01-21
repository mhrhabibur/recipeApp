//
//  DetailRecipeManager.swift
//  Recipe App
//
//  Created by Habibur Rahman on 1/21/22.
//

import Foundation

class DetailRecipeManager {
    
    
    
   // let url = URL(string: "https://recipesapi.herokuapp.com/api/v2/recipes?q=indian&page=1")!
    
    func fetchData(searchText: String, completion: @escaping (DetailRecipe?, Error?) -> Void) {
        let url = URL(string: "https://recipesapi.herokuapp.com/api/v2/recipes?q=\(searchText)&page=1")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do{
                    let recipes = try JSONDecoder().decode(DetailRecipe.self, from: data)
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
