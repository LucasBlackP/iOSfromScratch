//
//  LoginContainer.swift
//  CustomCell
//
//  Created by Tran Dinh Thang on 5/16/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import Foundation

public final class LoginContainer {
    private var registry = [String: [() -> Any]]()
    
    private init() {
        
    }
}

extension LoginContainer {
    static let shareInstance = LoginContainer()
    
    func register<Plugin>(plugin: Plugin.Type, with implementation: @escaping @autoclosure () -> Plugin){
        let key = String(describing: plugin)
        let plugins = registry[key] ?? []
        registry[key] = plugins + [implementation]
    }
}

internal extension LoginContainer {
    
    func resolve<T>(forPlugin pluginToResolve: T.Type) -> [T] {
        let key = String(describing: pluginToResolve)
        guard let plugins = registry[key]?.compactMap({ $0() as? T }), !plugins.isEmpty else {
            return []
        }
        return plugins
    }
    
}

