//
//  UserLoader.swift
//  CustomCell
//
//  Created by Thang Tran on 6/22/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import Foundation

enum ResultSearch<Value> {
    case success(Value)
    case error(Error)
}

enum Error: Swift.Error {
    case missingData
    case emptyData
}

class UserLoader {
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    private let urlSession: URLSession
    
    func loadUser(matching query: String,
                  completionHandler: @escaping  (ResultSearch<[User]>) -> Void) {
        let url = requestURL(forQuery: query)
        
        let task = urlSession.dataTask(with: url) { (data, _, error) in
            
            switch (data, error) {
            case (_, let error?):
                completionHandler(.error(error as! Error))
            case (let data?, _):
                do {
                    let users: [User] = try self.unbox(data: data)
                    completionHandler(.success(users))
                } catch {
                    completionHandler(.error(error as! Error))
                }
            case (nil, nil):
                completionHandler(.error(Error.missingData))
            }
        }

    }
    
    func unbox(data: Data) throws -> [User] {
        guard !data.isEmpty else {
            throw Error.emptyData
        }
        return [User]()
    }
    
    // TODO: - need fix later
    func requestURL(forQuery: String) -> URL {
        return URL(string: forQuery)!
        
    }
    
    
}
