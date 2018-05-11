//
//  ProfileInteractor.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 5/8/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class ProfileInteractor: ProfileInteractorProtocol{
    var presenter: ProfilePresenterProtocol?
    var networkLayer: NetworkProtocol?
    
    func loadData() {
        let userInfoData = UserModel(avatar: UIImage(named: "avatar")!, username: "John Roberts", nickname: "Spider man", birthday: "06/02/1987", hometown: "New York - USA")
        let userHistory = [WatchedVideoModel(dateWatched: "10/03/2018",videoImage: UIImage(named: "zalopay")!, videoTitle: "Shape of you", videoLength: 3.12),WatchedVideoModel(dateWatched: "10/03/2018",videoImage: UIImage(named: "zalopay")!, videoTitle: "Wrecking ball", videoLength: 4.02),WatchedVideoModel(dateWatched: "11/03/2018",videoImage: UIImage(named: "avatar")!, videoTitle: "Levels", videoLength: 5.11),WatchedVideoModel(dateWatched: "15/03/2018",videoImage: UIImage(named: "avatar")!, videoTitle: "Waiting for love", videoLength: 4.38),WatchedVideoModel(dateWatched: "07/04/2018",videoImage: UIImage(named: "zalopay")!, videoTitle: "Closer", videoLength: 3.56)]
        presenter?.onDataLoaded(data: ProfileTableModel(userInfo: userInfoData, videoHistory: userHistory,headers: ["","History"]))
    }
    
}
