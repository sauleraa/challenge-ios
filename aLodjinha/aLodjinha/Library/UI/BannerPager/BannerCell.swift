//
//  BannerCell.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import UIKit

class BannerCell: UICollectionViewCell {

    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(withIten item: Banner) {
        let imagePath = item.urlImagem
        imageView.cacheImage(urlString: imagePath)
    }
    
    static func identifier() -> String {
        return "BannerCell"
    }
}
