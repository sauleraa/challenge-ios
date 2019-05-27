//
//  ProductReservationRequest.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import UIKit

class ProductReservationRequest: AbstractRequest {

    let productId: String
    
    init(productId: String) {
        self.productId = productId
        super.init()
    }
    
    override var path: URL {
        guard let url = URL(string: EndPoint.productReservation(id: productId).fullPath) else {
            fatalError("Invalid URL path")
        }
        return url
    }
    
    override var httpMethod: HTTPMethod {
        return .post
    }
    
    override func toDictionary() -> [String : Any]? {
        return nil
    }
}
