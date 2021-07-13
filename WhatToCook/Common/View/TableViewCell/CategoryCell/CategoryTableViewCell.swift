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
    
    var delegate: myTableDelegate?
    
    @IBOutlet weak var columnLeft: ImageWithTextView!
    @IBOutlet weak var columnCenter: ImageWithTextView!
    @IBOutlet weak var columnRight: ImageWithTextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let leftColumnTapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                    action: #selector(CategoryTableViewCell.cellClicked(sender:)))
        columnLeft.addGestureRecognizer(leftColumnTapGestureRecognizer)
        
        let centerColumnTapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                      action: #selector(CategoryTableViewCell.cellClicked(sender:)))
        columnCenter.addGestureRecognizer(centerColumnTapGestureRecognizer)
        
        let rightCoLumnTapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                     action: #selector(CategoryTableViewCell.cellClicked(sender:)))
        columnRight.addGestureRecognizer(rightCoLumnTapGestureRecognizer)
    }
    
    @objc func cellClicked(sender: UITapGestureRecognizer) {
        guard let clickedView = sender.view as? ImageWithTextView else { return }
        delegate?.myTableDelegate(clickedView)
    }
    
    func initializeCell(model: TableViewRowModel) {
        if let categoryLeft = model.categoryLeft {
            columnLeft.initComponent(imageUrl: categoryLeft.categoryThumb,
                                     text: categoryLeft.name,
                                     url: categoryLeft.url,
                                     id: String(categoryLeft.id))
        }
        
        if let categoryCenter = model.categoryCenter {
            columnCenter.initComponent(imageUrl: categoryCenter.categoryThumb,
                                       text: categoryCenter.name,
                                       url: categoryCenter.url,
                                       id: String(categoryCenter.id))
        }
        
        if let categoryRight = model.categoryRight {
            columnRight.initComponent(imageUrl: categoryRight.categoryThumb,
                                      text: categoryRight.name,
                                      url: categoryRight.url,
                                      id: String(categoryRight.id))
        }
    }
}

protocol myTableDelegate {
    func myTableDelegate(_ clickedView: ImageWithTextView)
}
