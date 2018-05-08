//
//  WatchedVideoModel.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 5/8/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class WatchedVideoModel{
    let dateWatched: String
    var videoTitle: String
    let videoLength: Double
    init(dateWatched: String, videoTitle: String, videoLength: Double){
        self.dateWatched = dateWatched
        self.videoTitle = videoTitle
        self.videoLength = videoLength
    }
}
