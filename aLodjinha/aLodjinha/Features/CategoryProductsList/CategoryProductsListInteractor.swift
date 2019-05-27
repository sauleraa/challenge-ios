//
//  CategoryProductsListInteractor.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import Foundation

class CategoryProductsListInteractor {
    
    func getCategoryProducts(withId id:String, offset: String,  success: @escaping (_ list: [Product], _ total: Int) -> (), failure: @escaping (ResponseError) -> ()) {
        let request = ProductsFromCategoryRequest(categoryId: id, limit: "20", offset: offset)
        
        Network.sharedInstance.request(request: request) { (response: ProductsFromCategoryResponse) in
            
            if let list = response.list,
                let total = response.total {
                success(list, total)
            } else {
                failure(response.responseError())
            }
        }
        
    }
}
