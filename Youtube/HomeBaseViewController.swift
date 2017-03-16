//
//  HomeBaseViewController.swift
//  Youtube
//
//  Created by Sai206511854 on 3/12/17.
//  Copyright © 2017 Sai206511854. All rights reserved.
//

import UIKit

class HomeBaseViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var mb: MenuBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var titlelabel: UILabel!
    
    let titles: [String] = ["  Home", "  Trending", "  Account", "  Subscription"]
    
    lazy private var blackView: BlackView = {
        let view = BlackView()
        view.homeBaseVC = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        navigationController?.navigationBar.isTranslucent = false
        
        titlelabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width-32, height: view.frame.height))
        titlelabel.text = "  Home"
        titlelabel.textColor = UIColor.white
        titlelabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titlelabel
        collectionView?.backgroundColor = UIColor.white
        
        setupMenuBar()
        setUpNavBarItems()
        setUpcollection()
    }
    
    private func setUpcollection() {
        if let flow = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flow.scrollDirection = .horizontal
            flow.minimumLineSpacing = 0
            flow.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        }
        collectionView.isPagingEnabled = true
    }
    
    private func setupMenuBar() {
        mb.homeController = self
    }
    
    private func setUpNavBarItems() {
        let image = UIImage(named: "search_icon")
        let searchBarButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleSearch))
        searchBarButton.tintColor = UIColor.white
        
        let image2 = UIImage(named: "nav_more_icon")
        let moreBarButton = UIBarButtonItem(image: image2, style: .plain, target: self, action: #selector(handleMore))
        moreBarButton.tintColor = UIColor.white

        navigationItem.rightBarButtonItems = [moreBarButton, searchBarButton]
    }
    
    @objc private func handleSearch() {

    }
    
    @objc private func handleMore() {
        blackView.handleMore()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == ItemsConfig.Home.rawValue {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? FeedCell {
                return cell
            }
        }
        if indexPath.item == ItemsConfig.Trending.rawValue || indexPath.item == ItemsConfig.Account.rawValue || indexPath.item == ItemsConfig.Subscription.rawValue {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as? TrendingCell {
                
                cell.backgroundColor = UIColor.white
                
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ItemsConfig.itemsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width-10, height: collectionView.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        mb.leftConstraint?.constant = scrollView.contentOffset.x/4
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            self?.mb.layoutIfNeeded()
        })
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let xPos = targetContentOffset.pointee.x/collectionView.frame.width
        setTitleLabel(item: Int(xPos))
        let idx = IndexPath(item: Int(xPos), section: 0)
        
        mb.collectionView.selectItem(at: idx, animated: true, scrollPosition: [])
    }
    
    func scrolltoPosition(menuItem: Int) {
        setTitleLabel(item: menuItem)
        let idx = IndexPath(item: menuItem, section: 0)
        collectionView.scrollToItem(at: idx, at: [], animated: true)
    }
    
    //Helper methods
    func presentVC(text: String) {
        let newVC = SettingsViewController()
        newVC.title = text
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
    private func setTitleLabel(item: Int) {
        titlelabel.text = titles[item]
    }

}

extension HomeBaseViewController {
    enum ItemsConfig: Int {
        case Home = 0
        case Trending = 1
        case Subscription = 2
        case Account = 3
        
        static func itemsCount() -> Int {
            return 4
        }
    }
}

struct reuseIdentifiers {
    static let cell = "cellID"
}
