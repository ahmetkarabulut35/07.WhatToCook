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
    
    var clickUrl: URL?
    var id: String?
    var tapAction: ((_ url: URL) -> ())?
    
    
    func initComponent(imageUrl: URL?, text: String?, url: URL? = nil, id: String, tapAction: ((_ url: URL) -> ())? = nil) {
        setupFromNib()
        
        if let url = imageUrl {
            serviceHelper.getImage(url: url, service: service) { (image) in
                self.imageView.image = image
            }
        }
        
        self.id = id
        
        if let txt = text {
            label.text = txt
        }
        
        if url != nil && tapAction != nil  {
            self.clickUrl = url
            self.tapAction = tapAction
            self.isUserInteractionEnabled = true
            
            let gesture = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
            self.addGestureRecognizer(gesture)
        }
    }
    
    @objc func tapGesture() {
        tapAction?(clickUrl!)
        print("testimgtexttap")
    }
}
