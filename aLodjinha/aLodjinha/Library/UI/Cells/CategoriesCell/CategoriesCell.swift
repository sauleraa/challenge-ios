//
//  CategoriesCell.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import UIKit

protocol CategoriesCellDelegate: NSObjectProtocol {
    func didSelectCategory(category: ProductCategory)
}

class CategoriesCell: UITableViewCell {

    // MARK: - Oulets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    weak var delegate: CategoriesCellDelegate?
    var itemList: [ProductCategory] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK: - Methods
    func setup(withItem itemlist: [ProductCategory], delegate: CategoriesCellDelegate?) {
        let nib = UINib(nibName: CategoryCell.identifier(), bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: CategoryCell.identifier())
        self.itemList = itemlist
        self.delegate = delegate
    }
    
    static func identifier() -> String {
        return "CategoriesCell"
    }
    
}

// MARK: - Methods
extension CategoriesCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier(), for: indexPath) as! CategoryCell
        
        cell.setup(withIten: itemList[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectCategory(category: itemList[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 75, height: 90)
    }
}
