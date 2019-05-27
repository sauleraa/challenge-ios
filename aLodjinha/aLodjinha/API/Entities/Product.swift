//
//  Product.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import Foundation

struct Product: Codable {
    
    var id: Int?
    var nome: String?
    var urlImagem: String?
    var descricao: String?
    var precoDe: Double?
    var precoPor: Double?
    var categoria: ProductCategory?
    
}
