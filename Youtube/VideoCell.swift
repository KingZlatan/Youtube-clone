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
            
            setupImages()
            mainTextLabel.text = video?.albumTitle
            
            if let views = video?.views {
                if let duration = video?.duration {
                    if let channelname = video?.channel.name {
                        let fm = NumberFormatter()
                        fm.numberStyle = .decimal
                        subtitleTextLabel.text = "\(channelname), \(fm.string(from: NSNumber(value: views))!) views, uploaded \(duration) days ago"
                    }
                }
            }
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var mainTextLabel: UILabel!
    
    @IBOutlet weak var subtitleTextLabel: UILabel!
    
    var networkRequest: YoutubeNetwork = YoutubeNetwork()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
        
    private func setupImages() {
        let url = URL(string: (video?.albumCoverImage)!)!
        networkRequest.perform(url: url, success: { [weak self] (data) in
            DispatchQueue.main.async {
                self?.imageView.image = UIImage(data: data)
            }
        }) { (error) in
            
        }
        
        let url1 = URL(string: (video?.channel.profileImage)!)!
        networkRequest.perform(url: url1, success: { [weak self] (data) in
            DispatchQueue.main.async {
                self?.profileImageView.image = UIImage(data: data)
            }
        }) { (error) in
            
        }

    }
}
