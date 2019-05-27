//
//  ProductDetailRouter.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import Foundation
import UIKit

class ProductDetailRouter: BaseRouter {
    
    static func makeModule(withProduct product: Product) -> UIViewController {
        
        let vc = ProductDetailViewController()
        let router = ProductDetailRouter(viewController: vc)
        let interactor = ProductDetailInteractor()
        let presenter = ProductDetailPresenter(delegate: vc, router: router, interactor: interactor, product: product)
        
        vc.presenter = presenter
        vc.hidesBottomBarWhenPushed = true
        
        return vc
    }
    
    func pop() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
