//
//  CategoryProductsListRouter.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import Foundation
import UIKit

class CategoryProductsListRouter: BaseRouter {
    
    static func makeModule(withCategory category: ProductCategory) -> UIViewController {
        
        let vc = CategoryProductsListViewController()
        let router = CategoryProductsListRouter(viewController: vc)
        let interactor = CategoryProductsListInteractor()
        let presenter = CategoryProductsListPresenter(delegate: vc, router: router, interactor: interactor, category: category)
        
        vc.presenter = presenter
        vc.hidesBottomBarWhenPushed = true
        
        return vc
    }
    
    func navigateToProductDetail(product: Product) {
        let backButton = UIBarButtonItem()
        backButton.title = CategoryProductsStrings.backButtonTitle.localized()
        viewController?.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        let vc = ProductDetailRouter.makeModule(withProduct: product)
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
