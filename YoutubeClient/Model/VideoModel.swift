//
//  VideoModel.swift
//  YoutubeClient
//
//  Created by Tanabe Yuki on 2017/11/08.
//  Copyright © 2017年 Tanabe Yuki. All rights reserved.
//

import Foundation
import Alamofire

class VideoModel: NSObject {
    
    var list = [[String:Any]]()
    
    func load(success: @escaping () -> Void, failed: @escaping () -> Void) {
        Alamofire.request("https://www.googleapis.com/youtube/v3/search?key=AIzaSyDKIFKd1xQO6QxqoEts757t_pQoN8spoo4&part=snippet&channelId=UCO7gI_N7xAmvE7HbIFtFtgw&maxResults=50").responseJSON { response in
            //print(response.result.value)
            guard let value = response.result.value as? [String:Any],
                let items = value["items"] as? [[String:Any]] else {
                    failed()
                    return
            }
            
            self.list = items
            success()
        }
    }
}
