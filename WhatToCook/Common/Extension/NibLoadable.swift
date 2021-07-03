//
//  NibLoadable.swift
//  WhatToCook
//
//  Created by ACK Catalina on 30.06.2021.
//

import UIKit

public protocol NibLoadableView: class {
    
}

public extension NibLoadableView where Self: UIView {
    
    static var bundle: Bundle {
        return Bundle(for: Self.self)
    }
    
    static var nibName: String {
        return String(describing: Self.self)
    }
    
    static var nib: UINib {
        return UINib(nibName: Self.nibName, bundle: Self.bundle)
    }
    
    func setupFromNib() {
        guard let view = Self.nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Error loading (self) from nib")
        }
        
        view.backgroundColor = .clear
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([ view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                      view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                      view.topAnchor.constraint(equalTo: self.topAnchor),
                                      view.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
}
