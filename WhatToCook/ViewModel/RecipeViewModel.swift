//
//  RecipeViewModel.swift
//  WhatToCook
//
//  Created by ACK Catalina on 12.07.2021.
//

import Foundation
import UIKit

struct RecipeViewModel {
    
    
    func getRecipe(recipeId:String, completion: @escaping(Recipe?) -> ()) {
        serviceHelper.getMeals(url: constant.recipeIdUrl + recipeId, service: service) { (recipes) in
            if recipes.count > 0 {
                completion(recipes.first)
            }
        }
    }
    
    func getSimilarRecipes(area:String, completion: @escaping([Recipe]?) -> ()) {
        serviceHelper.getMeals(url: constant.areaRecipeSearchUrl + area, service: service) { (recipes) in
            if recipes.count > 0 {
                completion(recipes)
            }
        }
    }
    
    func getImage(url:URL?, completion: @escaping(UIImage) -> ()) {
        serviceHelper.getImage(url: url, service: service) { (image) in
            completion(image)
        }
    }
}
