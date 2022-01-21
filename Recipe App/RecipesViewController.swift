//
//  RecipesViewController.swift
//  Recipe App
//
//  Created by Habibur Rahman on 1/21/22.
//

import Foundation
import UIKit

class RecipesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    let detailRecipeManager = DetailRecipeManager()
    
    var categoryName: String?
    var searchText:String = ""
    var allRecipes = [Details]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let category = categoryName {
            searchText = category
        }
        print(searchText)
        detailRecipeManager.fetchData(searchText: searchText) { detailRecipe, error in
            if let myRecipe = detailRecipe {
                self.allRecipes = myRecipe.recipes
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allRecipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailRecipes", for: indexPath)
        //cell.textLabel?.text = "Hello"
        cell.textLabel?.text = allRecipes[indexPath.row].title
        return cell
    }
    
}
