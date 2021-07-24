//
//  BaseModel.swift
//  WhatToCook
//
//  Created by ACK Catalina on 24.07.2021.
//

import Foundation

class BaseModel {
    var id: String
    var name: String
    var thumb: URL?
    
    init(id: String = "", name: String = "", thumb: URL? = nil) {
        self.id = id
        self.name = name
        self.thumb = thumb
    }
}
