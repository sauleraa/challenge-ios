//
//  ProductCell.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    // MARK: - Oulets
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblOriginalPrice: UILabel!
    @IBOutlet weak var lblNewPrice: UILabel!
    
    // MARK: - Methods
    func setup(withItem item: Product) {
        
        lblProductName.text = item.nome ?? "-"
        imgProduct.image = #imageLiteral(resourceName: "imgPlaceholder")
        lblNewPrice.text = ProductStrings.newValue.localized([Utils.formatToCurrency(value: item.precoPor)])
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: ProductStrings.originalValue.localized([Utils.formatToCurrency(value: item.precoDe)]))
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        lblOriginalPrice.attributedText = attributeString
        
        let imagePath = item.urlImagem ?? "-"
        
        imgProduct.cacheImage(urlString: imagePath)
    }
    
    static func identifier() -> String {
        return "ProductCell"
    }
    
}
