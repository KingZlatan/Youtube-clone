//
//  BlackView.swift
//  Youtube
//
//  Created by Sai206511854 on 3/13/17.
//  Copyright © 2017 Sai206511854. All rights reserved.
//

import UIKit

class BlackView: UIView {
    
    private var height: CGFloat!
    private var width: CGFloat!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
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
            height = window.frame.height/2
            width = window.frame.width
            collectionView.frame = CGRect(x: 0, y: height*2, width: window.frame.width, height: height)
            
            UIView.animate(withDuration: 0.3, animations: { [weak self] in
                self?.alpha = 0.5
                self?.collectionView.frame = CGRect(x: 0, y: (self?.height)!, width: (self?.width)!, height: (self?.height)!)
            })
        }
    }
    
    
    @objc private func handleDismiss() {
        
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            self?.alpha = 0
            self?.collectionView.frame = CGRect(x: 0, y: (self?.height)!*2, width: (self?.width)!, height: (self?.height)!)

        }) { [weak self] (_) in
            self?.collectionView.removeFromSuperview()
            
        }
    }

}
