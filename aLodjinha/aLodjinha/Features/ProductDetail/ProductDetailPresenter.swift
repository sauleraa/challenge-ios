//  
//  ProductDetailPresenter.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import Foundation

protocol ProductDetailPresenterDelegate: NSObjectProtocol {
    func startLoadActivity()
    func stopLoadActivity()
    func showMessage(_ message: String)
    func setImage(path:String)
    func setProductName(name: String)
    func setProductOriginalPrice(price: String)
    func setProductNewPrice(price: String)
    func setProductDescription(description: String)
    func setNavTitle(title: String)
    func showSuccesAlert(message: String, buttonTitle: String)
}

class ProductDetailPresenter {

    weak var delegate : ProductDetailPresenterDelegate?
    let router: ProductDetailRouter
    let interactor: ProductDetailInteractor
    let product: Product
    
    init(delegate: ProductDetailPresenterDelegate, router: ProductDetailRouter, interactor: ProductDetailInteractor, product: Product) {
        
        self.delegate = delegate
        self.product = product
        self.router = router
        self.interactor = interactor
    }
    
    func didLoad() {
        
        delegate?.setImage(path: product.urlImagem ?? "")
        delegate?.setProductName(name: product.nome ?? "")
        delegate?.setProductOriginalPrice(price: ProductStrings.originalValue.localized([Utils.formatToCurrency(value: product.precoDe)]))
        delegate?.setProductNewPrice(price: ProductStrings.newValue.localized([Utils.formatToCurrency(value: product.precoPor)]))
        delegate?.setProductDescription(description: product.descricao ?? "")
        delegate?.setNavTitle(title: product.categoria?.descricao ?? "")
    }
    
    func willApper() {
        
    }
    
    func didAppear() {
        
    }
    
    func productReservation() {
        guard let id = product.id else { return }
        delegate?.startLoadActivity()
        
        interactor.productReservation(withId: String(id), success: { (message) in
            self.delegate?.stopLoadActivity()
            if message == "success" {
                self.delegate?.showSuccesAlert(message: ProductDetailStrings.reservationDialogTitle.localized(), buttonTitle: ProductDetailStrings.reservationDialogButtonTitle.localized())
            } else {
                self.delegate?.showMessage(message)
            }
        }) { (error) in
            self.delegate?.stopLoadActivity()
            self.delegate?.showMessage(error.message)
        }
    }
    
    func succesAlertAction() {
        router.pop()
    }
}
