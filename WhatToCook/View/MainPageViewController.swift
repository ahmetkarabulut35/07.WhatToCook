//
//  ViewController.swift
//  WhatToCook
//
//  Created by ACK Catalina on 27.06.2021.
//

import UIKit

class MainPageViewController: BaseViewController {
        
    @IBOutlet weak var randomRecipeView: ImageWithTextView!
    @IBOutlet weak var categoryTableView: UITableView!
    @IBOutlet weak var searchBarTextField: UITextField!
    
    private let viewModel = MainPageViewModel()
    private let categoryColumnCount = 3
    
    var categories = [CategoryModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryTableView.register(UINib(nibName: "ThreeColumnTableViewCell", bundle: nil), forCellReuseIdentifier: ThreeColumnTableViewCell().identifier)
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        
        getRandomRecipe()
        getCategories()
        
    }
    
    @IBAction func searchButtonClick(_ sender: Any) {
        if let searchText = searchBarTextField.text {
            viewModel.searchRecipes(text: searchText) { (recipes) in
                if let vc = self.storyboard?.instantiateViewController(identifier: "CategoryViewController") as? CategoryViewController {
                    vc.recipeSearchResults(recipes: recipes)
                    self.goToViewController(viewController: vc)
                }
            }
        }
    }
    
    func getRandomRecipe() {
        viewModel.getRandomRecipe { [weak self] (recipe) in
            if let randomRecipe = recipe {
                
                self?.randomRecipeView.initComponent(imageUrl: randomRecipe.thumb,
                                                     text: randomRecipe.name,
                                                     url: randomRecipe.id != "" ?
                                                        URL(string: constant.recipeIdUrl + String(randomRecipe.id)) :
                                                        nil,
                                                     id: String(randomRecipe.id),
                                                     tapAction: { (url) in
                                                        
                                                        if let vc = self?.storyboard?.instantiateViewController(identifier: "RecipeViewController") as? RecipeViewController {
                                                            vc.recipeId = String(randomRecipe.id)
                                                            vc.getRecipe()
                                                            self?.goToViewController(viewController: vc)
                                                        }
                                                        
                                                     }
                )
            }
        }
    }
    
    func getCategories() {
        if categories.count == 0 {
            viewModel.getCategories { [weak self] (categoryModels) in
                self?.categories = categoryModels
                self?.categoryTableView.reloadData()
            }
        }
    }
}

extension MainPageViewController: UITableViewDelegate, UITableViewDataSource, myTableDelegate, UIGestureRecognizerDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        let rowCount = Double(categories.count / categoryColumnCount).rounded(.up)
        return Int(rowCount)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ThreeColumnTableViewCell().identifier, for: indexPath) as! ThreeColumnTableViewCell
        
        cell.delegate = self
        cell.isUserInteractionEnabled = true
        
        let firstColumnIndex = indexPath.row * categoryColumnCount
        
        let catLeft = getCategory(index: firstColumnIndex)
        let catCenter = getCategory(index: firstColumnIndex + 1)
        let catRight = getCategory(index: firstColumnIndex + 2)
        
        cell.initializeCell(model: BaseModelTableViewRowModel(columnLeft: catLeft,
                                                              columnCenter: catCenter,
                                                              columnRight: catRight))
        return cell
    }
    
    @objc func myTableDelegate(_ tappedView: ImageWithTextView) {
        if let vc = self.storyboard?.instantiateViewController(identifier: "CategoryViewController") as? CategoryViewController {
            vc.categoryId = tappedView.id
            vc.getCategory()
            self.goToViewController(viewController: vc)
        }
    }
    
    func getCategory(index: Int) -> CategoryModel? {
        if categories.count >= index {
            return categories[index]
        }
        
        return nil
    }
}

