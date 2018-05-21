//
//  FirstLaunch.swift
//  CustomCell
//
//  Created by Tran Dinh Thang on 5/16/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import Foundation

final class FirstLaunch {
    
    let userDefaults: UserDefaults = .standard
    
    let wasLaunchedBefore: Bool
    var isFirstLaunch: Bool {
        return !wasLaunchedBefore
    }
    
//    init() {
//        let key = "com.vng.FirstLaunch.WasLaunchedBefore"
//        let wasLaunchedBefore = userDefaults.bool(forKey: key)
//        self.wasLaunchedBefore = wasLaunchedBefore
//        if !wasLaunchedBefore {
//            userDefaults.set(true, forKey: key)
//        }
//    }
    init(getWasLaunchedBefore: () -> Bool,
         setWasLaunchedBefore: (Bool) -> ()) {
        let wasLaunchedBefore = getWasLaunchedBefore()
        self.wasLaunchedBefore = wasLaunchedBefore
        if !wasLaunchedBefore {
            setWasLaunchedBefore(true)
        }
    }
    
    convenience init(userDefaults: UserDefaults, key: String) {
        self.init(getWasLaunchedBefore: { userDefaults.bool(forKey: key) },
                  setWasLaunchedBefore: { userDefaults.set($0, forKey: key) })
    }
}

// usage
/*
 let firstLaunch = FirstLaunch(userDefaults: .standard, key: "com.any-suggestion.FirstLaunch.WasLaunchedBefore")
 if firstLaunch.isFirstLaunch {
 // do things
 }
 */
