//
//  CategoryTableViewCell.swift
//  WhatToCook
//
//  Created by ACK Catalina on 30.06.2021.
//

import UIKit

struct BaseModelTableViewRowModel {
    var columnLeft: BaseModel?
    var columnCenter: BaseModel?
    var columnRight: BaseModel?
}

class ThreeColumnTableViewCell: UITableViewCell {

    let identifier = "ThreeColumnTableViewCell"
    
    var delegate: myTableDelegate?
    
    @IBOutlet weak var columnLeft: ImageWithTextView!
    @IBOutlet weak var columnCenter: ImageWithTextView!
    @IBOutlet weak var columnRight: ImageWithTextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let leftColumnTapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                    action: #selector(ThreeColumnTableViewCell.cellClicked(sender:)))
        columnLeft.addGestureRecognizer(leftColumnTapGestureRecognizer)
        
        let centerColumnTapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                      action: #selector(ThreeColumnTableViewCell.cellClicked(sender:)))
        columnCenter.addGestureRecognizer(centerColumnTapGestureRecognizer)
        
        let rightCoLumnTapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                     action: #selector(ThreeColumnTableViewCell.cellClicked(sender:)))
        columnRight.addGestureRecognizer(rightCoLumnTapGestureRecognizer)
    }
    
    @objc func cellClicked(sender: UITapGestureRecognizer) {
        guard let clickedView = sender.view as? ImageWithTextView else { return }
        delegate?.myTableDelegate(clickedView)
    }
    
    func initializeCell(model: BaseModelTableViewRowModel) {
        if let modelLeft = model.columnLeft {
            columnLeft.initComponent(imageUrl: modelLeft.thumb,
                                     text: modelLeft.name,
                                     id: modelLeft.id)
        }
        
        if let modelCenter = model.columnCenter {
            columnCenter.initComponent(imageUrl: modelCenter.thumb,
                                       text: modelCenter.name,
                                       id: modelCenter.id)
        }
        
        if let modelRight = model.columnRight {
            columnRight.initComponent(imageUrl: modelRight.thumb,
                                      text: modelRight.name,
                                      id: modelRight.id)
        }
    }
}

protocol myTableDelegate {
    func myTableDelegate(_ clickedView: ImageWithTextView)
}
