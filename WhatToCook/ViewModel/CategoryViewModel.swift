//
//  CategoryViewModel.swift
//  WhatToCook
//
//  Created by ACK Catalina on 24.07.2021.
//

import Foundation

struct CategoryViewModel {
    func getRecipesInCategory(categoryId:String, completion: @escaping([Recipe]) -> ()) {
        serviceHelper.getMeals(url: constant.categoryUrl + categoryId, service: service) { (recipes) in
            if recipes.count > 0 {
                completion(recipes)
            }
        }
    }
}
