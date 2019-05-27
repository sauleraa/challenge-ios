//
//  ProductsTopSaleResponse.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import UIKit

class ProductsTopSaleResponse: AbstractResponse {

    var list: [Product]?
    
    override func parseModel() throws {
        guard let data = data else { return }
        let response = try JSONDecoder().decode(ProductList.self, from: data)
        list = response.data
    }
    
}
