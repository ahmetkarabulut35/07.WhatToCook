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
        var id: String
        var name: String
        var thumb: URL?
        
        id = strCategory ?? ""
        name = id
        if let stringThumbUrl = strCategoryThumb, let thumbUrl = URL(string: stringThumbUrl){
            thumb = thumbUrl
        }
        
        return CategoryModel(id: id, name: name, thumb: thumb)
    }
}

class CategoryModel: BaseModel {
    
}
