//
//  RecipeCollectionViewCell.swift
//  WhatToCook
//
//  Created by ACK Catalina on 12.07.2021.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    
    let identifier = "recipeCollectionViewCell"
    
    var delegate: myTableDelegate?
    
    @IBOutlet weak var cell: ImageWithTextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let leftColumnTapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                    action: #selector(ThreeColumnTableViewCell.cellClicked(sender:)))
        cell.addGestureRecognizer(leftColumnTapGestureRecognizer)
        
        
    }
    
    @objc func cellClicked(sender: UITapGestureRecognizer) {
        guard let clickedView = sender.view as? ImageWithTextView else { return }
        delegate?.myTableDelegate(clickedView)
    }
    
    func initializeCell(model: Recipe) {
        cell.initComponent(imageUrl: model.thumb, text: model.name, url: URL(string:constant.recipeIdUrl + String(model.id)), id: String(model.id))
    }
}
