//
//  CustomTabBarController.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tabBar.tintColor = .customPurple
        tabBar.isTranslucent = false
        viewControllers = getTabBarControllers()
        configureTabIcons()
    }

    func getTabBarControllers() -> [UIViewController] {
        
        let controllers = [HomeRouter.makeModule(), AboutRouter.makeModule()]
        
        return controllers
    }
    
    func configureTabIcons() {
        
        guard let items = tabBar.items, items.count == 2 else { return }
        
        items[0].title = "Home"
        items[0].image = #imageLiteral(resourceName: "ic_tab_home")
        items[0].selectedImage = #imageLiteral(resourceName: "ic_tab_home_selected")
        
        items[1].title = "Sobre"
        items[1].image = #imageLiteral(resourceName: "ic_tab_about")
        items[1].selectedImage = #imageLiteral(resourceName: "ic_tab_about_selected")

    }
}
