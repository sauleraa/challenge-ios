//
//  HomeInteractor.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import UIKit

class HomeInteractor {

    func getBanners( success: @escaping (_ list: [Banner]) -> (), failure: @escaping (ResponseError) -> ()) {
        let request = BannerRequest()
        
        Network.sharedInstance.request(request: request) { (response: BannerResponse) in
            
            if let list = response.list {
                success(list)
            } else {
                failure(response.responseError())
            }
        }
        
    }
    
    func getCategories( success: @escaping (_ list: [ProductCategory]) -> (), failure: @escaping (ResponseError) -> ()) {
        let request = CategoriesRequest()
        
        Network.sharedInstance.request(request: request) { (response: CategoriesResponse) in
            
            if let list = response.list {
                success(list)
            } else {
                failure(response.responseError())
            }
        }
        
    }
    
    public func getTopSales( success: @escaping (_ list: [Product]) -> (), failure: @escaping (ResponseError) -> ()) {
        let request = ProductsTopSaleRequest()
        
        Network.sharedInstance.request(request: request) { (response: ProductsTopSaleResponse) in
            
            if let list = response.list {
                success(list)
            } else {
                failure(response.responseError())
            }
        }
        
    }
}
