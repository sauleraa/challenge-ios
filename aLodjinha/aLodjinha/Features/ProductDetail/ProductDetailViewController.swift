//  
//  ProductDetailViewController.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import UIKit

class ProductDetailViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblProductOriginalPrice: UILabel!
    @IBOutlet weak var lblProductNewPrice: UILabel!
    @IBOutlet weak var lblProductDescription: UILabel!
    
    // MARK: - Properties
    var presenter : ProductDetailPresenter!
    
    // MARK: - View Lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        presenter.didLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.willApper()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.didAppear()
    }
    
    // MARK: - Methods
    
    
    // MARK: - Actions
    @IBAction func reservProduct(_ sender: Any) {
        presenter.productReservation()
    }
    
}

// MARK: - ProductDetailPresenterDelegate
extension ProductDetailViewController: ProductDetailPresenterDelegate {
    
    func showSuccesAlert(message: String, buttonTitle: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: buttonTitle, style: .default) { (action) in
            self.presenter.succesAlertAction()
        })
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func setImage(path: String) {
        imgProduct.cacheImage(urlString: path)
    }
    
    func setProductName(name: String) {
        lblProductName.text = name
    }
    
    func setProductOriginalPrice(price: String) {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string:price)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        lblProductOriginalPrice.attributedText = attributeString
    }
    
    func setProductNewPrice(price: String) {
        lblProductNewPrice.text = price
    }
    
    func setProductDescription(description: String) {
        lblProductDescription.attributedText = description.htmlAttributed(using: UIFont(name: "Helvetica Neue", size: 10)!, color: .customGray)
    }
    
    func setNavTitle(title: String) {
        self.title = title
    }
    
    
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
