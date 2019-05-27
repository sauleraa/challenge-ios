//
//  APIConfig.swift
//  aLodjinha
//
//  Created by Saulo Costa on 25/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import Foundation

enum Environment {
    case hml, prd
}

enum EndPoint {
    
    // MARK: Banner
    case banner
    
    // MARK: Categories
    case categories
    
    // MARK: Product
    case productsFromCategory(categoryId: String, limit: String, offset: String)
    case productsTopSale
    case productWithId(id: String)
    case productReservation(id: String)
    
}

extension EndPoint {
    
    private var hmlUrl: String { return "https://alodjinha.herokuapp.com" }
    private var prdUrl: String { return "https://alodjinha.herokuapp.com" }
    private var selectedEnvironment: Environment { return .hml }
    
    private var baseURL: String { return selectedEnvironment == .prd ? prdUrl : hmlUrl }
    
    private var path: String {
        switch self {
        case .banner: return "/banner"
        case .categories: return "/categoria"
        case .productsFromCategory(let id, let limit, let offset): return "/produto?categoriaId=\(id)&limit=\(limit)&offset=\(offset)"
        case .productsTopSale: return "/produto/maisvendidos"
        case .productWithId(let id): return "/produto/\(id)"
        case .productReservation(let id): return "/produto/\(id)"
        }
    }
    
    var fullPath: String { return baseURL+path }
}

enum HTTPMethod {
    case get
    case post
    case put
}

extension HTTPMethod {
    var method: String {
        switch self {
        case .get:  return "GET"
        case .post: return "POST"
        case .put: return "PUT"
        }
    }
}
