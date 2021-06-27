//
//  ViewController.swift
//  WhatToCook
//
//  Created by ACK Catalina on 27.06.2021.
//

import UIKit

class MainPageViewController: UIViewController {
    private var viewModel = MainPageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getRandomMeal { (meal) in
            print(meal)
        }
    }

}

