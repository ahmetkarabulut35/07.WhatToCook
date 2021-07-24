//
//  MainPageViewModel.swift
//  WhatToCook
//
//  Created by ACK Catalina on 27.06.2021.
//

import Foundation

struct MainPageViewModel {
        
    func getRandomRecipe(completion: @escaping(Recipe?) -> ()) {
        serviceHelper.getMeals(url: constant.randomRecipeUrl, service: service) { (recipes) in
            if recipes.count > 0 {
                completion(recipes.first)
            }
        }
    }
    
    func getCategories(completion: @escaping([CategoryModel]) -> ())  {
        serviceHelper.getCategories(service: service) { (categories) in
            completion(categories)
        }
    }
    
    func searchRecipes(text: String, completion: @escaping([Recipe]) -> ()) {
        serviceHelper.getMeals(url: constant.searchUrl + text, service: service) { (recipes) in
            if recipes.count > 0 {
                completion(recipes)
            }
        }
    }
}
