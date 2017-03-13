//
//  Networking.swift
//  Youtube
//
//  Created by Sai206511854 on 3/13/17.
//  Copyright © 2017 Sai206511854. All rights reserved.
//

import UIKit

class YoutubeNetwork {
    
    func perform(url: URL, success: @escaping (Data)->() , failure: @escaping (Error) -> ()) {
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard error == nil else {
                failure(YoutubeNetworkErrors.networkConnectionIssue)
                return
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode != 200 {
                    failure(YoutubeNetworkErrors.networkConnectionIssue)
                    return
                    
                }
            }
            
            guard let data = data else {
                return
            }
            
            success(data)
        })
        task.resume()
    }

}
