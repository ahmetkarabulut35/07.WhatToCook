//
//  CategoryModel.swift
//  WhatToCook
//
//  Created by ACK Catalina on 29.06.2021.
//

import Foundation

struct Categories: Codable {
    let categories: [Category]
    
    func getCategoryModels() -> [CategoryModel] {
        var categoryModels = [CategoryModel]()
        
        for category in categories {
            categoryModels.append(category.convertCategoryJsonToCategory())
        }
        
        return categoryModels
    }
}

struct Category: Codable {
    let idCategory: String?
    let strCategory: String?
    let strCategoryThumb: String?
    
    func convertCategoryJsonToCategory() -> CategoryModel {
        var id = 0
        var name: String
        var thumb: URL?
        
        if let idStr = idCategory, let idInt = Int(idStr) {
            id = idInt
        }
        name = strCategory ?? ""
        if let stringThumbUrl = strCategoryThumb, let thumbUrl = URL(string: stringThumbUrl){
            thumb = thumbUrl
        }
        
        return CategoryModel(id: id, name: name, categoryThumb: thumb)
        
    }
}

struct CategoryModel {
    var id: Int
    var name: String
    var categoryThumb: URL?
}
