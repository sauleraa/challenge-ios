//  
//  HomePresenter.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import Foundation

protocol HomePresenterDelegate: NSObjectProtocol {
    func startLoadActivity()
    func stopLoadActivity()
    func showMessage(_ message: String)
    func setBanners(list: [Banner])
    func reloadList()
    func showRetry()
    func setNavTitle(title: String)
}

class HomePresenter {

    // MARK: - Properties
    weak var delegate : HomePresenterDelegate?
    var router: HomeRouter
    var interactor: HomeInteractor
    var bannerList: [Banner] = []
    
    var productCategories: [ProductCategory] = [] {
        didSet {
            delegate?.reloadList()
        }
    }
    
    var productsTopSale: [Product] = [] {
        didSet {
            delegate?.reloadList()
        }
    }
    
    // MARK: - Init
    init(delegate: HomePresenterDelegate, router: HomeRouter, interactor: HomeInteractor) {
        self.router = router
        self.interactor = interactor
        self.delegate = delegate
    }
    
    // MARK: - Methods
    func didLoad() {
        delegate?.setNavTitle(title: HomeStrings.title.localized())
        loadItems()
    }
    
    func willApper() {
        
    }
    
    func didAppear() {
        
    }
    
    func loadItems() {
        loadBanners()
    }
    
    private func loadBanners() {
        delegate?.startLoadActivity()
        interactor.getBanners(success: { (list) in
            self.delegate?.setBanners(list: list)
            self.loadCategories()
        }) { (error) in
            self.delegate?.showRetry()
        }
    }
    
    private func loadCategories() {
        interactor.getCategories(success: { (list) in
            self.productCategories = list
            self.loadTopSales()
        }) { (error) in
            self.delegate?.showRetry()
        }
    }
    
    private func loadTopSales() {
        interactor.getTopSales(success: { (list) in
            self.productsTopSale = list
            self.delegate?.stopLoadActivity()
        }) { (error) in
            self.delegate?.showRetry()
        }
    }
    
    func selectedCategory(category: ProductCategory) {
        router.navigateToCategoryProducts(category: category)
    }
    
    func selectedProduct(product: Product) {
        router.navigateToProductDetail(product: product)
    }
}
