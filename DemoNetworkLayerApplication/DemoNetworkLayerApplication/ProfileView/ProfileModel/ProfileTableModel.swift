//
//  ProfileTableModel.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 5/8/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class ProfileTableModel{
    var userInfo: UserModel?
    var videoHistory: [WatchedVideoModel]?
    var configureCell = [[CellConfigurator]]()
    var headers: [String]?
    init(userInfo: UserModel,videoHistory: [WatchedVideoModel], headers: [String]){
        self.userInfo = userInfo
        self.videoHistory = videoHistory
        typealias StringSet = [String: String]
        let userInfoSection:[CellConfigurator] = [TableCellConfigurator<UserAvatarCell,UserModel>.init(item: self.userInfo!),TableCellConfigurator<TitleDescriptionCell,StringSet>.init(item: ["Birthday: ": (self.userInfo?.birthday)!]),TableCellConfigurator<TitleDescriptionCell,StringSet>.init(item: ["Hometown: ": (self.userInfo?.hometown)!])]
        let historySection:[CellConfigurator] = self.videoHistory!.map{(video)->CellConfigurator in
            TableCellConfigurator<VideoHistoryCell,WatchedVideoModel>.init(item: video)}
        self.configureCell = [userInfoSection,historySection]
        self.headers = headers
    }
}
