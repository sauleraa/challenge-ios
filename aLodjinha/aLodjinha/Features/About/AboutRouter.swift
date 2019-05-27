//
//  AboutRouter.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import UIKit

class AboutRouter: BaseRouter {

    static func makeModule() -> UIViewController {
        
        let vc = AboutViewController()
        let router = AboutRouter(viewController: vc)
        let presenter = AboutPresenter(delegate: vc, router: router)
        
        vc.presenter = presenter
        
        let navigation = CustomNavigationController(rootViewController: vc)
        
        return navigation
    }
}
