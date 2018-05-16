//
//  Authenticator.swift
//  CustomCell
//
//  Created by Tran Dinh Thang on 5/16/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import Foundation

public final class Authenticator {
    init() {}
    
    func authenticateSuccessfully() {
        print("Logging in...")
        print("Logged in successfully...")
       // LoginContainer.instance.resolve(forPlugin: PostLoginSuccessPlugin.self).forEach(successfulLogin)
        LoginContainer.shareInstance.resolve(forPlugin: PostLoginSuccessPlugin.self).forEach(successfulLogin)
    }
    
    func authenticateUnsuccessfully() {
        print("Logging in...")
        print("Logged in unsuccessfully...")
        LoginContainer.shareInstance.resolve(forPlugin: PostLoginFailurePlugin.self).forEach(failedLogin)
    }
}

private extension Authenticator {
    
    func successfulLogin(plugin: PostLoginSuccessPlugin) {
        plugin.successfulLogin(userId: "1234")
    }
    
    func failedLogin(plugin: PostLoginFailurePlugin) {
        plugin.failedLogin(error: FailedLogin.userNotFound)
    }
    
}
