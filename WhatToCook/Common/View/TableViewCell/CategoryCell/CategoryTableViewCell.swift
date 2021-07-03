//
//  CategoryTableViewCell.swift
//  WhatToCook
//
//  Created by ACK Catalina on 30.06.2021.
//

import UIKit

struct TableViewRowModel {
    var categoryLeft: CategoryModel?
    var categoryCenter: CategoryModel?
    var categoryRight: CategoryModel?
}

class CategoryTableViewCell: UITableViewCell {

    let identifier = "categoryTableViewCell"
    
    @IBOutlet private weak var columnLeft: ImageWithTextView!
    @IBOutlet private weak var columnCenter: ImageWithTextView!
    @IBOutlet private weak var columnRight: ImageWithTextView!
    
    func initializeCell(model: TableViewRowModel) {
        if let categoryLeft = model.categoryLeft {
            columnLeft.initComponent(imageUrl: categoryLeft.categoryThumb, text: categoryLeft.name)
        }
        
        if let categoryCenter = model.categoryCenter {
            columnCenter.initComponent(imageUrl: categoryCenter.categoryThumb, text: categoryCenter.name)
        }
        
        if let categoryRight = model.categoryRight {
            columnRight.initComponent(imageUrl: categoryRight.categoryThumb, text: categoryRight.name)
        }
    }
    
}
