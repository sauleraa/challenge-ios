//
//  LoadingView.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import UIKit

class LoadingView: UIView {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    static func identifier() -> String {
        return "LoadingView"
    }
}
