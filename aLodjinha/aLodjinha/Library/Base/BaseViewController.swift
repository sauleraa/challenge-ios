//
//  BaseViewController.swift
//  Marvel
//
//  Created by Saulo Costa on 17/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    weak var loadingView: LoadingRetryView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadingView = Bundle.main.loadNibNamed(LoadingRetryView.identifier(), owner: self, options: nil)?.first as? LoadingRetryView
        view.addSubview(loadingView)
        loadingView.setup(withDelegate: self)
    }
    
    func showLoader() {
        loadingView.show()
        loadingView.startAnimate()
    }
    
    func hideLoader() {
        loadingView.stopAnimate(showRetry: false)
        loadingView.hide()
    }
    
    func showRetry() {
        loadingView.stopAnimate(showRetry: true)
    }
    
    func didRetry() {
        preconditionFailure("This method must be overridden")
    }
    
    func toastMessage(_ message: String) {
        guard let window = UIApplication.shared.keyWindow else {return}
        let messageLbl = UILabel()
        messageLbl.text = message
        messageLbl.textAlignment = .center
        messageLbl.font = UIFont.systemFont(ofSize: 12)
        messageLbl.textColor = .white
        messageLbl.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        let textSize:CGSize = messageLbl.intrinsicContentSize
        let labelWidth = min(textSize.width, window.frame.width - 40)
        
        messageLbl.frame = CGRect(x: 20, y: window.frame.height - 90, width: labelWidth + 30, height: textSize.height + 20)
        messageLbl.center.x = window.center.x
        messageLbl.layer.cornerRadius = messageLbl.frame.height/2
        messageLbl.layer.masksToBounds = true
        window.addSubview(messageLbl)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            UIView.animate(withDuration: 1, animations: {
                messageLbl.alpha = 0
            }) { (_) in
                messageLbl.removeFromSuperview()
            }}
    }
}

// MARK: - LoadingRetryViewDelegate
extension BaseViewController: LoadingRetryViewDelegate {
    
    func didSelectRetry() {
        didRetry()
    }
    
}
