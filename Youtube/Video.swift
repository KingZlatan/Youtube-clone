//
//  Video.swift
//  Youtube
//
//  Created by Sai206511854 on 3/12/17.
//  Copyright © 2017 Sai206511854. All rights reserved.
//

import UIKit

class Video: NSObject {
    

    var duration: Double!
    var views: Double!
    var albumCoverImage: String!
    var albumTitle: String!

    var channel: Channel!
    
    override init() {
        
    }
    
    enum VideoConfig: String {
        case duration = "duration"
        case numberofViews = "number_of_views"
        case thumbnailImage = "thumbnail_image_name"
        case title = "title"
        case channel = "channel"
    }
    
    init(json: [String: Any]) {
        if let duration = json[Video.VideoConfig.duration.rawValue] as? Double {
            self.duration = duration
        }
        if let numberOFviews = json[Video.VideoConfig.numberofViews.rawValue] as? Double {
            self.views = numberOFviews
        }
        if let thumbnailImage = json[Video.VideoConfig.thumbnailImage.rawValue] as? String {
            self.albumCoverImage = thumbnailImage
        }
        if let title = json[Video.VideoConfig.title.rawValue] as? String {
            self.albumTitle = title
        }
        if let channel = json[Video.VideoConfig.channel.rawValue] as? [String: Any] {
            self.channel = Channel(data: channel)
        }
    }
}
