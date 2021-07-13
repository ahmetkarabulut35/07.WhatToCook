//
//  Constant.swift
//  WhatToCook
//
//  Created by ACK Catalina on 29.06.2021.
//

import Foundation

var constant = Constant()

struct Constant {
    let appName = "What to Cook ?"
    
    let baseRecipeApiUrl = "https://www.themealdb.com/api/json/v1/1/"
    lazy var randomRecipeUrl = baseRecipeApiUrl + "random.php"
    lazy var categoriesUrl = baseRecipeApiUrl + "categories.php"
    lazy var recipeIdUrl = baseRecipeApiUrl + "lookup.php?i="
    lazy var areaRecipeSearchUrl = baseRecipeApiUrl + "filter.php?a="
    lazy var categoryUrl = baseRecipeApiUrl + "filter.php?c="
    lazy var searchUrl = baseRecipeApiUrl + "search.php?s="
}

