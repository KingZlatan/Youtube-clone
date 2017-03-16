//
//  BaseCell.swift
//  Youtube
//
//  Created by Sai206511854 on 3/12/17.
//  Copyright © 2017 Sai206511854. All rights reserved.
//

import UIKit


class BaseCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var videoList: [Video]?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUpViews()
    }
    
    func setUpViews() {
        
        readContentsOfFile()
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .white
        return cv
    }()
    
    func readContentsOfFile() {
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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = videoList?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 0, height: 0)
    }

}
