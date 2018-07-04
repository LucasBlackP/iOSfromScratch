//
//  UserAuthenticate.swift
//  CustomCell
//
//  Created by cpu12130-local on 6/25/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit



protocol UserAuthenticateDelegate: class{
    func onAuthenticateSuccess()
    func onAuthenticateError(message: String)
}

protocol UserAuthenticateProtocol: class{
    var delegate: UserAuthenticateDelegate?{get set}
     var state: UserAuthenticate.LoginState{get set}
}

class UserAuthenticate: NSObject, UserAuthenticateProtocol{
    
    enum LoginState{
        case success
        case error(message: String)
        case idle
    }
    
    var state: LoginState = .idle{
        didSet{
            stateDidChange()
        }
    }
    
    weak var delegate: UserAuthenticateDelegate?
    
    func stateDidChange(){
        switch self.state {
        case .idle:
            break
        case .success:
            delegate?.onAuthenticateSuccess()
        case .error(let message):
            delegate?.onAuthenticateError(message: message)
        }
    }
}

