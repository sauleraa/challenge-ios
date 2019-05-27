//
//  BannerPager.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import UIKit

class BannerPager: UIView {

    // MARK: - Oulets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: - Properties
    var itemList: [Banner] = [] {
        didSet {
            pageControl.numberOfPages = itemList.count
            pageControl.currentPage = 0
            collectionView.reloadData()
        }
    }
    
    // MARK: - Methods
    func setup() {
        let nib = UINib(nibName: BannerCell.identifier(), bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: BannerCell.identifier())
    }
    
    static func identifier() -> String {
        return "BannerPager"
    }

}

// MARK: - Methods
extension BannerPager: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.identifier(), for: indexPath) as! BannerCell

        cell.setup(withIten: itemList[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let urlString = itemList[indexPath.row].linkUrl,
        let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}
