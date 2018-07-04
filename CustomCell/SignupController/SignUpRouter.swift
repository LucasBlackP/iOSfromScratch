//
//  SignUpRouter.swift
//  CustomCell
//
//  Created by cpu12130-local on 6/21/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

protocol SignUpRouterProtocol {
    static func configure()->UIViewController
    func loadLoginScreen(form view: SignUpViewProtocol?)
}

class SignUpRouter: SignUpRouterProtocol{
    static func configure()->UIViewController{
        let signUpController = SignUpViewController()
        let signUpInteractor = SignUpInteractor()
        let router = SignUpRouter()
        signUpController.userAuthentication = UserAuthenticate()
        signUpController.interactor = signUpInteractor
        signUpInteractor.controller  = signUpController
        signUpInteractor.router = router
        return signUpController
    }
    func loadLoginScreen(form view: SignUpViewProtocol?) {
        guard let view = view as? UIViewController else{
            return
        }
        view.navigationController?.popToRootViewController(animated: true)
    }
}

