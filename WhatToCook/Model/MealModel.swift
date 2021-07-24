//
//  MealModel.swift
//  WhatToCook
//
//  Created by ACK Catalina on 27.06.2021.
//

import Foundation

struct Meal: Codable {
    let idMeal: String?
    let strMeal: String?
    let strCategory: String?
    let strInstructions: String?
    let strArea: String?
    let strMealThumb: String?
    let strTags: String?
    let strYoutube: String?
    let strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8: String?
    let strIngredient9, strIngredient10, strIngredien11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16: String?
    let strIngredient17, strIngredient18, strIngredient19, strIngredient20: String?
    let strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10: String?
    let strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20: String?
    
    public func convertMealToRecipe() -> Recipe {
        var id, name, category, area, instructions:String
        var thumb, youtube: URL?
        var tags = [String]()
        var ingredients = [Ingredient]()
        
        id = idMeal ?? ""
        name = strMeal ?? ""
        category = strCategory ?? ""
        area = strArea ?? ""
        instructions = strInstructions ?? ""
        if let stringThumbUrl = strMealThumb, let thumbUrl = URL(string: stringThumbUrl){
            thumb = thumbUrl
        }
        if let stringTags = strTags {
            tags = stringTags.components(separatedBy: ",")
        }
        if let stringYoutubeUrl = strMealThumb, let youtubeUrl = URL(string: stringYoutubeUrl){
            youtube = youtubeUrl
        }
        if let ing = strIngredient1, let mea = strMeasure1 {
            ingredients.append(Ingredient(name: ing, measure: mea))
        }
        
        return Recipe(id: id, name: name, thumb: thumb, category: category, area: area, instructions: instructions, tags: tags, youtube: youtube, ingredients: ingredients)
        
    }
}

struct Meals: Codable {
    let meals: [Meal]
    
    func getRecipes() -> [Recipe] {
        var recipes = [Recipe]()
        
        for meal in meals {
            recipes.append(meal.convertMealToRecipe())
        }
        
        return recipes
    }
}

class Recipe : BaseModel {
    var category: String
    var area: String
    var instructions: String
    var tags: [String]
    var youtube: URL?
    var ingredients : [Ingredient]?
    
    init(id: String = "", name: String = "", thumb: URL? = nil, category: String = "", area: String = "", instructions: String = "", tags: [String] = [], youtube: URL? = nil, ingredients: [Ingredient]? = nil) {
        self.category = category
        self.area = area
        self.instructions = instructions
        self.tags = tags
        self.youtube = youtube
        self.ingredients = ingredients
        
        super.init()
        self.id = id
        self.name = name
        self.thumb = thumb
    }
}

struct Ingredient{
    var name : String
    var measure : String
}
