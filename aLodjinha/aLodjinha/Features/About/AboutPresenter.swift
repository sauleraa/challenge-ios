//  
//  AboutPresenter.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import Foundation

protocol AboutPresenterDelegate: NSObjectProtocol {
    func startLoadActivity()
    func stopLoadActivity()
    func showMessage(_ message: String)
}

class AboutPresenter {

    weak var delegate : AboutPresenterDelegate?
    private var router: AboutRouter
    
    init(delegate: AboutPresenterDelegate, router: AboutRouter) {
        self.router = router
        self.delegate = delegate
    }
    
    func didLoad() {
        
    }
    
    func willApper() {
        
    }
    
    func didAppear() {
        
    }
}
