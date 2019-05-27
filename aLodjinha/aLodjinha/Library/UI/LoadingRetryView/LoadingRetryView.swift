//
//  LoadingRetryView.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import UIKit

protocol LoadingRetryViewDelegate: class {
    func didSelectRetry()
}

class LoadingRetryView: UIView {
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var btnRetry: UIButton!
    weak var delegate: LoadingRetryViewDelegate?

    // MARK: - Methods
    func setup(withDelegate delegate: LoadingRetryViewDelegate) {
        self.delegate = delegate
        guard let superview = superview else { return }
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor, constant: 0),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 0),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: 0),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: 0),
            ])
        translatesAutoresizingMaskIntoConstraints = false
        alpha = 0
        spinner.stopAnimating()
        btnRetry.alpha = 0
    }
    
    func show() {
        self.alpha = 1
    }
    
    func hide() {
        UIView.animate(withDuration: 0.3) {
            self.alpha = 0
        }
    }
    
    func startAnimate() {
        spinner.startAnimating()
        UIView.animate(withDuration: 0.3) {
            self.btnRetry.alpha = 0
        }
    }
    
    func stopAnimate(showRetry: Bool) {
        spinner.stopAnimating()
        UIView.animate(withDuration: 0.3) {
            self.btnRetry.alpha = showRetry ? 1 : 0
        }
    }

    @IBAction func retryAction(_ sender: Any) {
        delegate?.didSelectRetry()
    }
    
    static func identifier() -> String {
        return "LoadingRetryView"
    }
}
