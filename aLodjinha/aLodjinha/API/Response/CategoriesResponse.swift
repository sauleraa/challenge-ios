//
//  CategoriesResponse.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import UIKit

class CategoriesResponse: AbstractResponse {

    var list: [ProductCategory]?
    
    override func parseModel() throws {
        guard let data = data else { return }
        let response = try JSONDecoder().decode(ProductCategoryList.self, from: data)
        list = response.data
    }
    
}
