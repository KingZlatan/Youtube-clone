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
    
    var videoList: [Video]?
    
//    @IBOutlet weak var menuBarView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        navigationController?.navigationBar.isTranslucent = false
        
        let titlelabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width-32, height: view.frame.height))
        titlelabel.text = "Home"
        titlelabel.textColor = UIColor.white
        titlelabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titlelabel
        collectionView?.backgroundColor = UIColor.white
        
        readContentsOfFile()
        
        
        setupMenuBar()
        setUpNavBarItems()

    }
    
    private func readContentsOfFile() {
        let file = Bundle.main.path(forResource: "home", ofType: "json")
        
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: file!), options: .alwaysMapped)
            let data = try JSONSerialization.jsonObject(with: jsonData, options: .mutableLeaves)
            if let json = data as? [[String: Any]] {
                
                var videos = [Video]()
                for obj in json {
                    let parsed = Video(json: obj)
                    videos.append(parsed)
                }
                videoList = videos
            }
        } catch {
            print(error)
        }
    }
    
    private func setupMenuBar() {
        
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
        
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = videoList?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! VideoCell
        if let video = videoList {
            cell.video = video[indexPath.item]
        }
        return cell
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = (view.frame.width-32) * 9/16
        return CGSize(width: view.frame.width-32, height: height+70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }


}