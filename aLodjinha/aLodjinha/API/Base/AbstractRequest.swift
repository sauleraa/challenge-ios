//
//  AbstractRequest.swift
//  aLodjinha
//
//  Created by Saulo Costa on 25/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import Foundation

class AbstractRequest {
    
    var path : URL {
        preconditionFailure("This method must be overridden")
    }
    
    var headers : [String: String] {
        return ["Content-Type" : "application/json"]
    }
    
    var httpMethod : HTTPMethod {
        preconditionFailure("This method must be overridden")
    }
    
    public init() {}
    
    func toDictionary() -> [String : Any]? {
        preconditionFailure("This method must be overridden")
    }
    
}
