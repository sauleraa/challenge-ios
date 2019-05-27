//
//  HomeRouter.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import UIKit

class HomeRouter: BaseRouter {

    static func makeModule() -> UIViewController {
        
        let vc = HomeViewController()
        let router = HomeRouter(viewController: vc)
        let interactor = HomeInteractor()
        let presenter = HomePresenter(delegate: vc, router: router, interactor: interactor)
        
        vc.presenter = presenter
        
        let navigation = CustomNavigationController(rootViewController: vc)
        
        return navigation
    }
    
    func navigateToCategoryProducts(category: ProductCategory) {
        let vc = CategoryProductsListRouter.makeModule(withCategory: category)
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateToProductDetail(product: Product) {
        let vc = ProductDetailRouter.makeModule(withProduct: product)
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
