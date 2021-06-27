//
//  MainPageViewModel.swift
//  WhatToCook
//
//  Created by ACK Catalina on 27.06.2021.
//

import Foundation

struct MainPageViewModel {
    
    let service = Service()
    
    mutating func getRandomMeal(completion: @escaping(Recipe) -> ()) {
        let randomMealUrl = URL(string: "https://www.themealdb.com/api/json/v1/1/random.php")
        let _:Meals? = service.getData(url: randomMealUrl!) { (response) in
            if let recipe = response?.meals.first {
                completion(recipe.convertMealToRecipe())
            }
        }
    }
}
