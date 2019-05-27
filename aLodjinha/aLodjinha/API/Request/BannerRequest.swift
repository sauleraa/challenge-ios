//
//  BannerRequest.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import UIKit

class BannerRequest: AbstractRequest {

    override var path: URL {
        guard let url = URL(string: EndPoint.banner.fullPath) else {
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
