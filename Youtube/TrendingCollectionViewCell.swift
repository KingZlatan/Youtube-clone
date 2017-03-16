//
//  TrendingCollectionViewCell.swift
//  Youtube
//
//  Created by Sai206511854 on 3/15/17.
//  Copyright © 2017 Sai206511854. All rights reserved.
//

import UIKit

class TrendingCollectionViewCell: UICollectionViewCell {
    
    var video: Video? {
        didSet {
            setupImages()
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    var networkRequest: YoutubeNetwork = YoutubeNetwork()

    private func setupImages() {
        let url = URL(string: (video?.albumCoverImage)!)!
        networkRequest.perform(url: url, success: { [weak self] (data) in
            DispatchQueue.main.async {
                self?.imageView.image = UIImage(data: data)
            }
        }) { (error) in
            
        }
    }

}
