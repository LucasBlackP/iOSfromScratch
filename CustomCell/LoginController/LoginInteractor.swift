
//
//  LoginInteractor.swift
//  CustomCell
//
//  Created by cpu12130-local on 6/21/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit
import Firebase
protocol LoginInteractorProtocol: class{
    var loginController: LoginViewProtocol?{get set}
    func login(username: String, password: String)
    func signUp()
}

class LoginInteractor: LoginInteractorProtocol{
    weak var loginController: LoginViewProtocol?
    
    func login(username: String, password: String) {
        Auth.auth().signIn(withEmail: username, password: password){
            user, error in
            //Failed
            if let error = error{
                self.loginController?.onLoginError(message: error.localizedDescription)
                return
            }
            //Success
            self.loginController?.onLoginSuccess(viewController: self.onLoginSuccess())
        }
    }
    func signUp(){
        self.loginController?.pushView(viewController: SignUpRouter.configure())
    }
    func onLoginSuccess()->UIViewController{
        return LoginRouter.loadView()
    }
}
