//
//  PostLoginFailurePlugin.swift
//  CustomCell
//
//  Created by Tran Dinh Thang on 5/16/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import Foundation

public enum FailedLogin: Error {
    
    case userNotFound
    
}

public protocol PostLoginFailurePlugin {
    
    func failedLogin(error: FailedLogin)
    
}
