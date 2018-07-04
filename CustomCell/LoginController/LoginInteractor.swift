
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
    var router: LoginRouterProtocol?{get set}
    func login(username: String, password: String)
    func signUp()
    func onLoginSuccess()
    func passwordPattern()->String
    func usernamePattern()->String
}

class LoginInteractor: LoginInteractorProtocol{
    
    weak var loginController: LoginViewProtocol?
    var router: LoginRouterProtocol?
    
    func login(username: String, password: String) {
        Auth.auth().signIn(withEmail: username, password: password){
            user, error in
            if let error = error{
                self.loginController?.user?.state = .error(message: error.localizedDescription)
                return
            }
            //Success
            self.loginController?.user?.state = .success
        }
    }
    
    func signUp(){
        self.router?.loadSignUpScreen(from: self.loginController)
    }
    
    func onLoginSuccess(){
        router?.loadMenuScreen(from: self.loginController)
    }
    
    func passwordPattern() -> String {
        return "[a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9]"
    }
    func usernamePattern() -> String {
        return "[a-zA-Z0-9]+\\@[a-zA-Z0-9]+\\.[a-zA-Z0-9]+"
    }
}
