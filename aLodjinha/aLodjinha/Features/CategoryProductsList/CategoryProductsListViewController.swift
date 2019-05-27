//  
//  CategoryProductsListViewController.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import UIKit

class CategoryProductsListViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var presenter : CategoryProductsListPresenter!
    var loadingPage: LoadingView?
    
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
        setup()
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
    
    func setup() {
        loadingPage = Bundle.main.loadNibNamed(LoadingView.identifier(), owner: self, options: nil)?.first as? LoadingView
        loadingPage?.frame = CGRect(x: 0, y: 0, width: 0, height: 60)
        tableView.register(UINib(nibName: ProductCell.identifier(), bundle: nil), forCellReuseIdentifier: ProductCell.identifier())
        
        tableView.tableFooterView = loadingPage
    }
    
    // MARK: - Actions

}

// MARK: - CategoryProductsListPresenterDelegate
extension CategoryProductsListViewController: CategoryProductsListPresenterDelegate {
    
    func setNavTitle(title: String) {
        self.title = title
    }
    
    func reloadList() {
        tableView.reloadData()
        presenter.canLoad ? loadingPage?.activityIndicator.startAnimating() : loadingPage?.activityIndicator.stopAnimating()
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

// MARK: - UITableViewDataSource, UITableViewDelegate
extension CategoryProductsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if presenter.products.count == 0 {
            tableView.setEmptyMessage(EmptyStateStrings.message.localized())
        } else {
            tableView.restore()
        }
        
        return presenter.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier()) as! ProductCell
        
        cell.setup(withItem: presenter.products[indexPath.row])
        presenter.didDisplayIndex(index: indexPath)
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.selectedProduct(product: presenter.products[indexPath.row])
    }
}
