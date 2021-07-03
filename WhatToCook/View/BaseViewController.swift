//
//  BaseViewController.swift
//  WhatToCook
//
//  Created by ACK Catalina on 29.06.2021.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func viewDidLoad(title: String, buttonClickFunction: Selector?) {
        super.viewDidLoad()
        if let navBar = view?.subviews.filter({$0 is UINavigationBar}).first as? UINavigationBar {
            let navItem = UINavigationItem(title: title)
            
            if let buttonAction = buttonClickFunction {
                let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: buttonAction)
                //let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(objCFunction(nonObjCfunc: buttonAction)))
                navItem.rightBarButtonItem = doneItem
            }
            navBar.setItems([navItem], animated: true)
        }
    }
}
