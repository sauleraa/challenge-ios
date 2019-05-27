//
//  CategoryCell.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblCategoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(withIten item: ProductCategory) {
        
        lblCategoryName.text = item.descricao
        imageView.image = #imageLiteral(resourceName: "imgPlaceholder")
        let imagePath = item.urlImagem
        
        imageView.cacheImage(urlString: imagePath)
    }
    
    static func identifier() -> String {
        return "CategoryCell"
    }
}
