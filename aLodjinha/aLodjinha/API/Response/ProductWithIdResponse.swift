//
//  ProductWithIdResponse.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import UIKit

class ProductWithIdResponse: AbstractResponse {

    var product: Product?
    
    override func parseModel() throws {
        guard let data = data else { return }
        product = try JSONDecoder().decode(Product.self, from: data)
    }
    
}
