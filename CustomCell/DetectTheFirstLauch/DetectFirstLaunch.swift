//
//  DetectFirstLaunch.swift
//  CustomCell
//
//  Created by cpu12130-local on 6/19/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import Foundation

final class DetectFirstLaunch{
    let wasLaunchedBefore: Bool
    var isFirstLaunch: Bool{
        return !wasLaunchedBefore
    }
    init(getWasLaunchedBefore: ()->Bool, setWasLaunchedBefore: (Bool)->()){
        let wasLaunchedBefore = getWasLaunchedBefore()
        self.wasLaunchedBefore = wasLaunchedBefore
        if !wasLaunchedBefore{
            setWasLaunchedBefore(true)
        }
    }
    convenience init(userDefaults: UserDefaults, key: String){
        self.init(
            getWasLaunchedBefore: {
            return userDefaults.bool(forKey: key)
        }, setWasLaunchedBefore: {
            value in
            userDefaults.set(value, forKey: key)
        })
    }
    //Using for testing mode
    static func alwaysFirstLaunch()->DetectFirstLaunch{
        return DetectFirstLaunch(
            getWasLaunchedBefore: {
                return false
        }, setWasLaunchedBefore: {
            _ in
        })
    }
}
