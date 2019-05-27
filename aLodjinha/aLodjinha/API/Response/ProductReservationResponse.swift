//
//  ProductReservationResponse.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import UIKit

class ProductReservationResponse: AbstractResponse {

    var message: String?
    
    override func parseModel() throws {
        guard let data = data else { return }
        let result = try JSONDecoder().decode(ProductReservation.self, from: data)
        message = result.result
    }
    
}
