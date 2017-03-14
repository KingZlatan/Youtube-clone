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
    
    weak var homeController: HomeBaseViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCollectionView()
        setUpHMenuBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpCollectionView()
        setUpHMenuBar()
    }
    
    var menuHBar: UIView = {
        let hBar = UIView()
        hBar.backgroundColor = UIColor(white: 1, alpha: 1)
        hBar.translatesAutoresizingMaskIntoConstraints = false
        return hBar
    }()
    
    var leftConstraint: NSLayoutConstraint?
    
    private func setUpHMenuBar() {
        
        addSubview(menuHBar)
        leftConstraint = menuHBar.leftAnchor.constraint(equalTo: self.leftAnchor)
        leftConstraint!.isActive = true
        menuHBar.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25).isActive = true
        menuHBar.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        menuHBar.heightAnchor.constraint(equalToConstant: 4).isActive = true

        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        homeController?.scrolltoPosition(menuItem: indexPath.item)
        let xPos = CGFloat(indexPath.item)*frame.width/4
        leftConstraint?.constant = xPos
        
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            self?.layoutIfNeeded()
        })
    }
}

