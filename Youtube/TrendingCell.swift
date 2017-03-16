//
//  SubscriptionCell.swift
//  Youtube
//
//  Created by Sai206511854 on 3/15/17.
//  Copyright © 2017 Sai206511854. All rights reserved.
//

import UIKit

class TrendingCell: BaseCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.register(UINib(nibName: "TrendingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell1")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        collectionView.register(UINib(nibName: "TrendingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell1")
    }
    
    override func setUpViews() {
        super.setUpViews()
        addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        leadingAnchor.constraint(equalTo: collectionView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: collectionView.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: collectionView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
    
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as? TrendingCollectionViewCell {
            cell.video = videoList?[indexPath.item]
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height/3)
    }
    
}
