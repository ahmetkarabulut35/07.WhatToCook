//
//  Service.swift
//  WhatToCook
//
//  Created by ACK Catalina on 27.06.2021.
//

import Alamofire
import Foundation

//www.themealdb.com/api/json/v1/1/random.php

struct Service {
    func getData<T:Decodable>(url: URL, completion: @escaping(T?) -> ()) -> T?{
        
        let dataReq = AF.request(url)
        dataReq.responseData { (data) in
            
            if let dataResponse = data.data {
                let jsonObj = try? JSONDecoder().decode(T.self, from: dataResponse)
                completion(jsonObj)
            }
        }
        
        return nil
    }
}
