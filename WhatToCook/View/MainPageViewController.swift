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
    
    private let viewModel = MainPageViewModel()
    private let categoryColumnCount = 3
    
    var categories = [CategoryModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad(title: constant.appName, buttonClickFunction: nil)
        
        categoryTableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: CategoryTableViewCell().identifier)
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        
        getCategories()
        getRandomRecipe()
        
        
    }
    
    func getRandomRecipe() {
        viewModel.getRandomMeal { [weak self] (recipe) in
            if let randomRecipe = recipe {
                self?.randomRecipeView.initComponent(imageUrl: randomRecipe.thumb, text: randomRecipe.name)
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

extension MainPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        let rowCount = Double(categories.count / categoryColumnCount).rounded(.up)
        return Int(rowCount)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell().identifier, for: indexPath) as! CategoryTableViewCell
        
        let firstColumnIndex = indexPath.row * categoryColumnCount
        
        let catLeft = getCategory(index: firstColumnIndex)
        let catCenter = getCategory(index: firstColumnIndex + 1)
        let catRight = getCategory(index: firstColumnIndex + 2)
        
        cell.initializeCell(model: TableViewRowModel(categoryLeft: catLeft,
                                                    categoryCenter: catCenter,
                                                    categoryRight: catRight))
        
        return cell
    }
    
    func getCategory(index: Int) -> CategoryModel? {
        if categories.count >= index {
            return categories[index]
        }
        
        return nil
    }
    
}
