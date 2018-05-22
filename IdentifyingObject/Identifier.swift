//
//  Identifier.swift
//  CustomCell
//
//  Created by Thang Tran on 5/22/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import Foundation

struct Identifier <Value>: Hashable {
    let string: String
}


extension Identifier: ExpressibleByStringLiteral {
    init(stringLiteral value: String) {
        string = value
    }
}


extension Identifier: CustomStringConvertible {
    var description: String {
        return string
    }
}

extension Identifier: Codable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        string = try container.decode(String.self)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(string)
    }
}
