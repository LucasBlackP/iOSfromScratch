//
//  WatchedVideoModel.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 5/8/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class WatchedVideoModel{
    var videoImage: UIImage
    let dateWatched: String
    var videoTitle: String
    let videoLength: Double
    init(dateWatched: String, videoImage: UIImage, videoTitle: String, videoLength: Double){
        self.dateWatched = dateWatched
        self.videoImage = videoImage
        self.videoTitle = videoTitle
        self.videoLength = videoLength
    }
}
