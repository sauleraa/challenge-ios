//  
//  CategoryProductsListPresenter.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import Foundation

protocol CategoryProductsListPresenterDelegate: NSObjectProtocol {
    func startLoadActivity()
    func stopLoadActivity()
    func showMessage(_ message: String)
    func reloadList()
    func showRetry()
    func setNavTitle(title: String)
}

class CategoryProductsListPresenter {

    weak var delegate : CategoryProductsListPresenterDelegate?
    let router: CategoryProductsListRouter
    let interactor: CategoryProductsListInteractor
    let categoryId: Int
    let category: ProductCategory
    var isLoading: Bool = false
    var canLoad: Bool = true
    var offset: Int = 0
    var products: [Product] = [] {
        didSet {
            delegate?.reloadList()
        }
    }
    
    init(delegate: CategoryProductsListPresenterDelegate, router: CategoryProductsListRouter, interactor: CategoryProductsListInteractor, category: ProductCategory ) {
        self.router = router
        self.interactor = interactor
        self.delegate = delegate
        self.category = category
        self.categoryId = category.id ?? -1
    }
    
    func didLoad() {
        delegate?.setNavTitle(title: category.descricao ?? "")
        fetchProducts()
        delegate?.startLoadActivity()
    }
    
    func willApper() {
        
    }
    
    func didAppear() {
        
    }
    
    func didDisplayIndex(index: IndexPath) {
        if products.count > 5 {
            if index.row >= (products.count - 5) {
                fetchProducts()
            }
        }
    }
    
    func selectedProduct(product: Product) {
        router.navigateToProductDetail(product: product)
    }
    
    private func fetchProducts() {
        if canLoad && !isLoading {
            isLoading = true
            interactor.getCategoryProducts(withId: String(categoryId), offset: String(offset), success: { (list, total) in
                self.delegate?.stopLoadActivity()
                self.isLoading = false
                self.canLoad = list.count > 0
                self.products.append(contentsOf: list)
                if self.canLoad {
                    self.offset += 1
                }
            }) { (error) in
                self.isLoading = false
                if self.products.count == 0 {
                    self.delegate?.showRetry()
                }
            }
        }
    }
}
