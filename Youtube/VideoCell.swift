//
//  VideoCell.swift
//  Youtube
//
//  Created by Sai206511854 on 3/12/17.
//  Copyright © 2017 Sai206511854. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell {
    
    var video: Video? {
        didSet {
            
            setUpThumbnailImage()
//            profileImageView.image = UIImage(named: (video?.profileImage)!)
//            mainTextLabel.text = video?.albumTitle
//            subtitleTextLabel.text = video?.albumSubTitle
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var mainTextLabel: UILabel!
    
    @IBOutlet weak var subtitleTextLabel: UILabel!
    
    private func setUpThumbnailImage() {
        
        let url = URL(string: (video?.albumCoverImage)!)!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { [weak self] (data, response, error) in
            if let data = data {
                DispatchQueue.main.async {
                    self?.imageView.image = UIImage(data: data)
                }
            }
        })
        task.resume()
    }
    
}
