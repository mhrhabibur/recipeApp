//
//  DescriptionViewController.swift
//  Recipe App
//
//  Created by Walid Hossain on 21/1/22.
//

import Foundation
import UIKit

class DescriptionViewController: UIViewController {
    
    @IBOutlet weak var recipeImage: UIImageView!
    var  recipeDescriptionManagaer = RecipeDescriptionManagaer()
    
    var id: String?
    var recipeID: String = ""
    
    //var recipes = Array<Recipes>()
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let myRecipeID = id {
            recipeID = myRecipeID
        }
        recipeDescriptionManagaer.fetchData(recipeID: recipeID) { description, error in
            if let recipeDescription = description {
                
                
                DispatchQueue.main.async {
                    self.titleLabel.text = recipeDescription.recipe.title
                    
                    
                    let url = URL(string: recipeDescription.recipe.imageUrl)
                    let data = try? Data(contentsOf: url!)
                    
                    self.recipeImage.image = UIImage(data: data!)
                    
                }
            }
            
            
        }
        
        
        
    }
    
}
