//
//  CategoryViewController.swift
//  WhatToCook
//
//  Created by ACK Catalina on 8.07.2021.
//

import UIKit

class CategoryViewController: BaseViewController {

    let columnCount = 3
    var categoryId: String?
    var recipes = [Recipe]()
    
    @IBOutlet weak var recipesTableView: UITableView!
    private let viewModel = CategoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad(addBackButton: true, buttonClickFunction: nil)
        
        recipesTableView.register(UINib(nibName: "ThreeColumnTableViewCell", bundle: nil), forCellReuseIdentifier: ThreeColumnTableViewCell().identifier)
        recipesTableView.delegate = self
        recipesTableView.dataSource = self

    }
    
    func getCategory() {
        if categoryId != nil {
            viewModel.getRecipesInCategory(categoryId: categoryId!) {[weak self]  (recipeList) in
                self?.recipes = recipeList
                self?.recipesTableView.reloadData()
            }
        }
        else {
            //TODO: return back show error
        }
    }
}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource, myTableDelegate, UIGestureRecognizerDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        let rowCount = Double(recipes.count / columnCount).rounded(.up)
        return Int(rowCount)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ThreeColumnTableViewCell().identifier, for: indexPath) as! ThreeColumnTableViewCell
        
        cell.delegate = self
        cell.isUserInteractionEnabled = true
        
        let firstColumnIndex = indexPath.row * columnCount
        
        let recLeft = getRecipe(index: firstColumnIndex)
        let recCenter = getRecipe(index: firstColumnIndex + 1)
        let recRight = getRecipe(index: firstColumnIndex + 2)
        
        cell.initializeCell(model: BaseModelTableViewRowModel(columnLeft: recLeft,
                                                              columnCenter: recCenter,
                                                              columnRight: recRight))
        return cell
    }
    
    @objc func myTableDelegate(_ tappedView: ImageWithTextView) {
        /*if let vc = self.storyboard?.instantiateViewController(identifier: "CategoryViewController") as? CategoryViewController {
            vc.categoryId = tappedView.id
            vc.getCategory()
            self.goToViewController(viewController: vc)
        }*/
        
        
        if let vc = self.storyboard?.instantiateViewController(identifier: "RecipeViewController") as? RecipeViewController {
            vc.recipeId = tappedView.id
            vc.getRecipe()
            self.goToViewController(viewController: vc)
        }
    }
    
    func getRecipe(index: Int) -> Recipe? {
        if recipes.count >= index {
            return recipes[index]
        }
        
        return nil
    }
}
