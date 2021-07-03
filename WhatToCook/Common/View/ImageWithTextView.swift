//
//  ImageWithTextView.swift
//  WhatToCook
//
//  Created by ACK Catalina on 30.06.2021.
//

import UIKit
import Alamofire

class ImageWithTextView: UIView, NibLoadableView {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var label: UILabel!
    
    func initComponent(imageUrl: URL?, text: String?) {
        setupFromNib()
        
        if let url = imageUrl {
            serviceHelper.getImage(url: url, service: service) { (image) in
                self.imageView.image = image
            }
        }
        
        if let txt = text {
            label.text = txt
        }
    }
}
