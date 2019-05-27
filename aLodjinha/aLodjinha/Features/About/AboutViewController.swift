//  
//  AboutViewController.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import UIKit

class AboutViewController: BaseViewController {

    // MARK: - Outlets
    
    
    // MARK: - Properties
    var presenter : AboutPresenter!
    
    // MARK: - View Lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sobre"
        // Do any additional setup after loading the view.
        //presenter.didLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //presenter.willApper()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //presenter.didAppear()
    }
    
    // MARK: - Methods
    
    
    // MARK: - Actions

}

// MARK: - AboutPresenterDelegate
extension AboutViewController: AboutPresenterDelegate {
    
    func startLoadActivity() {
        showLoader()
    }
    
    func stopLoadActivity() {
        hideLoader()
    }
    
    func showMessage(_ message: String) {
        toastMessage(message)
    }
}
