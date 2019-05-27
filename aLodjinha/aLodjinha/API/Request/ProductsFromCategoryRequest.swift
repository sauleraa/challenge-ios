//
//  ProductsFromCategoryRequest.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import UIKit

class ProductsFromCategoryRequest: AbstractRequest {
    
    let categoryId: String
    let limit: String
    let offset: String
    
    init(categoryId: String, limit: String, offset:String) {
        self.categoryId = categoryId
        self.limit = limit
        self.offset = offset
        super.init()
    }

    override var path: URL {
        guard let url = URL(string: EndPoint.productsFromCategory(categoryId: categoryId, limit: limit, offset: offset).fullPath) else {
            fatalError("Invalid URL path")
        }
        return url
    }
    
    override var httpMethod: HTTPMethod {
        return .get
    }
    
    override func toDictionary() -> [String : Any]? {
        return nil
    }
}
