//
//  FeedCell.swift
//  Youtube
//
//  Created by Sai206511854 on 3/15/17.
//  Copyright © 2017 Sai206511854. All rights reserved.
//

import UIKit

class FeedCell: BaseCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "cellID")

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        collectionView.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "cellID")
    }
    
    override func setUpViews() {
        super.setUpViews()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        addSubview(collectionView)
        addConstraint(NSLayoutConstraint(item: collectionView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: collectionView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: collectionView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: collectionView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0))

        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "cellID")
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID",
                                                         for: indexPath) as? VideoCell
        {
            if let video = videoList {
                cell.video = video[indexPath.item]
                cell.profileImageView.layer.cornerRadius = cell.profileImageView.frame.width/2
                cell.profileImageView.contentMode = .scaleAspectFill
                cell.profileImageView.clipsToBounds = true
//                cell.mainTextLabel.text = "One"
            }
//            cell.backgroundColor = UIColor.blue
            return cell
            
        }
        return UICollectionViewCell()
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height/2)
    }
    
}
