//  
//  HomeViewController.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var presenter : HomePresenter!
    weak var bannerPager: BannerPager!
    var shouldSetup = true
    
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if shouldSetup {
            shouldSetup = false
            bannerPager = Bundle.main.loadNibNamed(BannerPager.identifier(), owner: self, options: nil)?.first as? BannerPager
            bannerPager.frame = CGRect(x: 0, y: 0, width: 0, height: view.frame.size.width/3)
            bannerPager.setup()
            tableView.tableHeaderView = bannerPager
        }
    }
    
    // MARK: - Methods
    func setup() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        imageView.image = #imageLiteral(resourceName: "img_nav_logo")
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        
        tableView.register(UINib(nibName: TitleHeaderCell.identifier(), bundle: nil), forCellReuseIdentifier: TitleHeaderCell.identifier())
        tableView.register(UINib(nibName: CategoriesCell.identifier(), bundle: nil), forCellReuseIdentifier: CategoriesCell.identifier())
        tableView.register(UINib(nibName: ProductCell.identifier(), bundle: nil), forCellReuseIdentifier: ProductCell.identifier())
    }
    
    override func didRetry() {
        presenter.loadItems()
    }
}

// MARK: - HomePresenterDelegate
extension HomeViewController: HomePresenterDelegate {
    
    func reloadList() {
        tableView.reloadData()
    }
    
    func setBanners(list: [Banner]) {
        bannerPager.itemList = list
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
    
    func setNavTitle(title: String) {
        self.title = title
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: TitleHeaderCell.identifier()) as! TitleHeaderCell
        
        cell.setup(withTitle: section == 0 ? HomeStrings.categoryTitle.localized() : HomeStrings.topSaleTitle.localized())
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : presenter.productsTopSale.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesCell.identifier()) as! CategoriesCell
            
            cell.setup(withItem: presenter.productCategories, delegate: self)
            
            return cell
        } else if indexPath.section == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier()) as! ProductCell
            
            cell.setup(withItem: presenter.productsTopSale[indexPath.row])
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            presenter.selectedProduct(product: presenter.productsTopSale[indexPath.row])
        }
    }
}

// MARK: - CategoriesCellDelegate
extension HomeViewController: CategoriesCellDelegate {
    
    func didSelectCategory(category: ProductCategory) {
        presenter.selectedCategory(category: category)
    }
    
}
