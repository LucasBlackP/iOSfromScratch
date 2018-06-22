//
//  SignUpRouter.swift
//  CustomCell
//
//  Created by cpu12130-local on 6/21/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class SignUpRouter{
    static func configure()->UIViewController{
        let signUpController = SignUpViewController()
        let signUpInteractor = SignUpInteractor()
        signUpController.interactor = signUpInteractor
        signUpInteractor.controller  = signUpController
        return signUpController
    }
}

