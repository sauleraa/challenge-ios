//
//  AbstractResponse.swift
//  aLodjinha
//
//  Created by Saulo Costa on 25/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import Foundation

class AbstractResponse {
    
    let data: Data?
    let urlResponse: HTTPURLResponse?
    let error: Error?
    
    required init(with data: Data?, urlResponse: HTTPURLResponse?, error: Error?) {
        
        self.data = data
        self.urlResponse = urlResponse
        self.error = error
        
        try? parseModel()
    }
    
    func succes() -> Bool {
        return (error == nil && urlResponse?.statusCode == 200) ? true : false
    }
    
    func responseError() -> ResponseError {
        guard let urlResponse = urlResponse else { return ResponseError(code: -1, message: "Generic error message")  }
        return ResponseError(code: urlResponse.statusCode,
                             message: HTTPURLResponse.localizedString(forStatusCode: urlResponse.statusCode))
    }
    
    func parseModel() throws {
        preconditionFailure("This method must be overridden")
    }
}

struct ResponseError {
    let code: Int!
    let message: String!
    
    init(code: Int, message: String) {
        self.code = code
        self.message = message
    }
}
