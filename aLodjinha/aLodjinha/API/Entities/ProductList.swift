//
//  ProductList.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import Foundation

struct ProductList: Codable {
    
    var data: [Product]
    var total: Int?
}
