//
//  BaseViewController.swift
//  WhatToCook
//
//  Created by ACK Catalina on 29.06.2021.
//

import UIKit

class BaseViewController: UIViewController {

    func viewDidLoad(addBackButton: Bool = false, buttonClickFunction: Selector? = nil) {
        super.viewDidLoad()
        configureNavbar(title: constant.appName, addBackButton: addBackButton)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavbar(title: constant.appName, addBackButton: false)
    }
    
    func configureNavbar(title: String, addBackButton: Bool = false) {
        if let navBar = view?.subviews.filter({$0 is UINavigationBar}).first as? UINavigationBar {
            let navItem = UINavigationItem(title: title)
            
            if addBackButton {
                let backItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(dismissView))
                backItem.title = "Back"
                navItem.leftBarButtonItem = backItem
            }
            navBar.setItems([navItem], animated: true)
        }
    }
    
    @objc func dismissView()
    {
        dismiss(animated: true, completion: nil)
    }
    
    func goToViewController(identifier: String? = nil, viewController: UIViewController? = nil, presentationStyle: UIModalPresentationStyle = .fullScreen) {
        var vc = UIViewController()
        if viewController != nil {
            vc = viewController!
        }
        else if identifier != nil {
            if let viewControl = storyboard?.instantiateViewController(identifier: identifier!)  {
                vc = viewControl
            }
        }
        
        vc.modalPresentationStyle = presentationStyle
        present(vc, animated: true)
    }
}
