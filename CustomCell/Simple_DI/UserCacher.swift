//
//  UserCacher.swift
//  CustomCell
//
//  Created by Tran Dinh Thang on 5/16/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import Foundation

enum Result<Value> {
    case success(Value)
    case failure(Error)
}

class User {
    
}

protocol UserDownloader {
    func downloadUser(withID id: Int, completion: @escaping (Result<User>) -> ())
}

protocol Caching {
    func cache(_ data: Data, at key: String)
}

protocol ErrorReporterProtocol {
    func report(_ error: Error)
}


class UserCache {
    let userDownloader: UserDownloader
    let cache: Caching
    let errorReporter: ErrorReporterProtocol
    
    init(userDownloader: UserDownloader, cache: Caching, errorReporter: ErrorReporterProtocol) {
        self.userDownloader = userDownloader
        self.cache = cache
        self.errorReporter = errorReporter
    }
    
    func cacheUser(withID id: Int) {
        userDownloader.downloadUser(withID: id) { (result) in
            switch result {
            case .success(let user):
                do {
                    let serializedUser = try user.asData()
                    self.cache.cache(serializedUser, at: "user-\(id)")
                } catch {
                    self.errorReporter.report(error)
                }
            case .failure(let error):
                self.errorReporter.report(error)
            }
        }
    }
}
