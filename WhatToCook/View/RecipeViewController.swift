//
//  RecipeViewController.swift
//  WhatToCook
//
//  Created by ACK Catalina on 8.07.2021.
//

import UIKit

class RecipeViewController: BaseViewController {

    var recipeId: String?
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageViewThumbnail: UIImageView!
    @IBOutlet weak var textViewDescription: UITextView!
    @IBOutlet weak var collectionViewSimilarRecipes: UICollectionView!
    
    private let viewModel = RecipeViewModel()
    var similarRecipes = [Recipe]()
    
    override func viewDidLoad() {
        super.viewDidLoad(addBackButton: true, buttonClickFunction: nil)
        if recipeId != nil {
            getRecipe()
        }
        else {
            //TODO: return back show error
        }
        
        collectionViewSimilarRecipes.register(UINib(nibName: "RecipeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: RecipeCollectionViewCell().identifier)
        
        collectionViewSimilarRecipes.delegate = self
        collectionViewSimilarRecipes.dataSource = self
        
    }
    
    func getRecipe() {
        if recipeId != nil {
            viewModel.getRecipe(recipeId: recipeId!) {[weak self] (recipeModel) in
                if let recipeName = recipeModel?.name {
                    self?.labelTitle.text = recipeName
                }
                self?.viewModel.getImage(url: recipeModel?.thumb) { (image) in
                    self?.imageViewThumbnail.image = image
                }
                self?.textViewDescription.text = recipeModel?.instructions
                if let area = recipeModel?.area {
                    self?.getSimilarRecipes(area: area)
                }
                
            }
        }
        else {
            //TODO: return back show error
        }
    }
    
    func getSimilarRecipes(area:String) {
        if similarRecipes.count == 0 {
            viewModel.getSimilarRecipes(area: area) { (recipes) in
                self.similarRecipes = recipes ?? [Recipe]()
                self.collectionViewSimilarRecipes.reloadData()
            }
        }
    }
}

extension RecipeViewController: UICollectionViewDelegate, myTableDelegate, UIGestureRecognizerDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return similarRecipes.count > 6 ? 6 : similarRecipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewSimilarRecipes.dequeueReusableCell(withReuseIdentifier: RecipeCollectionViewCell().identifier, for: indexPath) as! RecipeCollectionViewCell
        cell.delegate = self
        cell.isUserInteractionEnabled = true
        cell.initializeCell(model: similarRecipes[indexPath.row])
        
        return cell
    }
    
    @objc func myTableDelegate(_ tappedView: ImageWithTextView) {
        if let recipeId = tappedView.id {
            if let vc = self.storyboard?.instantiateViewController(identifier: "RecipeViewController") as? RecipeViewController {
                vc.recipeId = recipeId
                goToViewController(viewController: vc)
            }
        }
    }
}
