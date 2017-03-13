//
//  MenuBar.swift
//  Youtube
//
//  Created by Sai206511854 on 3/12/17.
//  Copyright © 2017 Sai206511854. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpCollectionView()

    }
    
    private func setUpCollectionView() {
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: "cellID")
        collectionView.backgroundColor = UIColor.rgb(red: 320, green: 32, blue: 31)
        let selectedIndex = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndex, animated: false, scrollPosition: [])
        addSubview(collectionView)
        
        addConstraint(NSLayoutConstraint(item: collectionView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: collectionView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: collectionView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: collectionView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0))

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! MenuCell
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width)/4, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

