//
//  Network.swift
//  aLodjinha
//
//  Created by Saulo Costa on 25/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import Foundation
import UIKit

struct Network {
    
    static let sharedInstance = Network()
    
    func request<T: AbstractRequest, U : AbstractResponse>(request : T, completion : @escaping (U)-> ()) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        // Request
        var urlRequest = URLRequest(url: request.path)
        urlRequest.httpMethod = request.httpMethod.method
        
        // POST
        if (request.httpMethod == .post || request.httpMethod == .put) {
            
            if let dict = request.toDictionary() {
                urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
            }
        }
        
        // Add Headers
        for (key, value) in request.headers {
            urlRequest.allHTTPHeaderFields?[key] =  value
        }
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            DispatchQueue.main.async {
                
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                
                let urlResponse = response as? HTTPURLResponse
                
                let responseObject: U = U(with: data, urlResponse: urlResponse, error: error)
                
                completion(responseObject)
            }
        }.resume()
    }
}
