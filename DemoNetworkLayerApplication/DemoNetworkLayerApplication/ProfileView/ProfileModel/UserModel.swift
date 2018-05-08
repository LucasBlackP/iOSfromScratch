//
//  UserModel.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 5/8/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class UserModel{
    var avatar: UIImage
    var username: String
    var nickname: String
    var birthday: String
    var hometown: String
    init(avatar: UIImage, username: String, nickname: String, birthday: String, hometown: String){
        self.avatar = avatar
        self.username = username
        self.nickname = nickname
        self.birthday = birthday
        self.hometown = hometown
    }
}
