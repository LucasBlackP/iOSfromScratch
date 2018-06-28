//
//  PartialUser.swift
//  CustomCell
//
//  Created by Thang Tran on 6/25/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import Foundation

struct PartialUser {
    
    let id: UUID
    let name: String
}

struct Region {
    
}

protocol ImmutableUser {
    var id: UUID { get }
    var name: String { get }
}

struct UserSignUp {
    let id: UUID
    let name: String
    var region: Region
    var email: String
}

extension PartialUser {
    typealias CompletionInfo = (region: Region, email: String)
    func completed(with infor: CompletionInfo) -> UserSignUp {
        return UserSignUp (
            id: id,
            name: name,
            region: infor.region,
            email: infor.email
        )
    }
}
