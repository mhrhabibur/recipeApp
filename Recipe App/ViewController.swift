//
//  ViewController.swift
//  Recipe App
//
//  Created by Habibur Rahman on 1/20/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var myCategories = [RecipeCategories]()
    
    
    @IBOutlet var tableView: UITableView!
    
    let recipeManager = RecipeManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Recipe"
        
        recipeManager.fetchData { recipes, err in
            if let myRecipe = recipes {
                self.myCategories = myRecipe.categories
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell", for: indexPath)
            cell.textLabel?.text = myCategories[indexPath.row].title
            return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailRecipe") as? RecipesViewController {
            
            
            vc.categoryName = String(myCategories[indexPath.row].title)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }


}

