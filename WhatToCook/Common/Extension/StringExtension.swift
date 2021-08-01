//
//  StringExtension.swift
//  WhatToCook
//
//  Created by ACK Catalina on 1.08.2021.
//

import Foundation

extension String {
    var youtubeId: String? {
        return URLComponents(string:self)?.queryItems?.first(where: { $0.name == "v" })?.value
    }
}
