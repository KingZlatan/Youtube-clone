//
//  BlackView.swift
//  Youtube
//
//  Created by Sai206511854 on 3/13/17.
//  Copyright © 2017 Sai206511854. All rights reserved.
//

import UIKit

class BlackView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private var height: CGFloat!
    private var width: CGFloat!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    @objc func handleMore() {
        
        if let window = UIApplication.shared.keyWindow {
            
            frame = window.frame
            backgroundColor = UIColor.black
            alpha = 0
            addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            window.addSubview(self)
            window.addSubview(collectionView)
            height = window.frame.height/3
            width = window.frame.width
            collectionView.register(SettingCell.self, forCellWithReuseIdentifier: "cellIDD")
            collectionView.frame = CGRect(x: 0, y: height*3, width: window.frame.width, height: height)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { [weak self] in
                self?.alpha = 0.5
                self?.collectionView.frame = CGRect(x: 0, y: (self?.height)!*2, width: (self?.width)!, height: (self?.height)!)
                
            }, completion: nil)
            
        }
    }
    
    
    @objc private func handleDismiss() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { [weak self] in
            self?.alpha = 0
            self?.collectionView.frame = CGRect(x: 0, y: (self?.height)!*3, width: (self?.width)!, height: (self?.height)!)
            
            }, completion: { [weak self] (_) in
                self?.collectionView.removeFromSuperview()
        })
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIDD", for: indexPath) as? SettingCell {
            cell.nameLabel.text = cell.model.nameSet[indexPath.item]
//            cell.image.image = UIImage(named: cell.model.imageSet[indexPath.item])
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: width, height: height/6)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}
