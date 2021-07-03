//
//  ServiceHelper.swift
//  WhatToCook
//
//  Created by ACK Catalina on 29.06.2021.
//

import Foundation
import UIKit

let serviceHelper = ServiceHelper()

struct ServiceHelper {
    
    func getMeals(url: String, service: Service, completion: @escaping([Recipe]) -> ()) {
        if let mealListUrl = URL(string: url) {
            let _:Meals? = service.getJsonData(url: mealListUrl) { (response) in
                if let mealArray = response?.meals {
                    let meals = Meals(meals: mealArray)
                    completion(meals.getRecipes())
                }
            }
        }
    }
    
    func getCategories(service: Service, completion: @escaping([CategoryModel]) -> ())  {
        if let categoryUrl = URL(string: constant.categoriesUrl) {
            let _:Categories? = service.getJsonData(url: categoryUrl) { (response) in
                if let categoryArray = response?.categories {
                    let cats = Categories(categories: categoryArray)
                    completion(cats.getCategoryModels())
                }
            }
        }
    }
    
    func getImage(url: URL?, service: Service, completion: @escaping(UIImage) -> ()) {
        if let imageUrl = url {
            service.getData(url: imageUrl) { (data) in
                if let imageData = data, let image = UIImage(data: imageData) {
                    completion(image)
                }
            }
        }
    }
}
