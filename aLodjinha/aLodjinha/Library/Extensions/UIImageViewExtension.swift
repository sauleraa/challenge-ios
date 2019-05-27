//
//  UIImageViewExtension.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    func cacheImage(urlString: String?){
        
        guard let urlString = urlString else {
            self.image = #imageLiteral(resourceName: "imgPlaceholder")
            return }
        
        let url = URL(string: urlString)
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url!) {
            data, response, error in
            if let response = data {
                DispatchQueue.main.async {
                    if let imageToCache = UIImage(data: response) {
                        imageCache.setObject(imageToCache, forKey: urlString as AnyObject)
                        self.image = imageToCache
                    } else {
                        self.image = #imageLiteral(resourceName: "imgPlaceholder")
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self.image = #imageLiteral(resourceName: "imgPlaceholder")
                }
            }
            }.resume()
    }
}
