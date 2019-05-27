//
//  ProductDetailInteractor.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import Foundation

class ProductDetailInteractor {
    
    func productReservation(withId id:String, success: @escaping (_ message: String) -> (), failure: @escaping (ResponseError) -> ()) {
        let request = ProductReservationRequest(productId: id)
        
        Network.sharedInstance.request(request: request) { (response: ProductReservationResponse) in
            if let message = response.message {
                success(message)
            } else {
                failure(response.responseError())
            }
        }
        
    }
}
