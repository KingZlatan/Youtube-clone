//
//  Channel.swift
//  Youtube
//
//  Created by Sai206511854 on 3/15/17.
//  Copyright © 2017 Sai206511854. All rights reserved.
//

import Foundation

class Channel: NSObject {
    
    var name: String!
    var profileImage: String!
    
    enum ChannelConfig: String {
        case name = "name"
        case profileImage = "profile_image_name"
    }
    
    init(data: [String: Any]) {
        if let name = data[Channel.ChannelConfig.name.rawValue] as? String {
            self.name = name
        }
        if let profImg = data[Channel.ChannelConfig.profileImage.rawValue] as? String {
            self.profileImage = profImg
        }
    }
    
    override init() {
        
    }
}
