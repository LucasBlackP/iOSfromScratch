//
//  UserProfilePostLoginPluginImpl.swift
//  CustomCell
//
//  Created by Tran Dinh Thang on 5/16/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import Foundation

final class UserProfilePostLoginPluginImpl: PostLoginSuccessPlugin {
    func successfulLogin(userId: UserId) {
        print("Fetching user profile with id \(userId)...")
    }
}
