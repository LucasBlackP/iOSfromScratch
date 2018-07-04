//
//  SignUpInteractor.swift
//  CustomCell
//
//  Created by cpu12130-local on 6/21/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit
import Firebase

protocol SignUpInteractorProtocol: class{
    var controller: SignUpViewProtocol?{get set}
    var router: SignUpRouterProtocol?{get set}
    func signUp(username: String, password: String, confirmPassword: String)
    func onSignUpSuccess()
    func passwordPattern()->String
    func usernamePattern()->String
}

class SignUpInteractor: SignUpInteractorProtocol{
    weak var controller: SignUpViewProtocol?
    var router: SignUpRouterProtocol?
    func signUp(username: String, password: String, confirmPassword: String) {
        if !checkConfirmPassword(password: password, confirmPassword: confirmPassword){
            self.controller?.userAuthentication?.state = .error(message: "Your password is incorrect")
            return
        }
        Auth.auth().createUser(withEmail: username, password: password){
            user, error in
            //Failed
            if let error = error{
                self.controller?.userAuthentication?.state = .error(message: error.localizedDescription)
                return
            }
            //Success
            self.controller?.userAuthentication?.state = .success
        }
    }
    func checkConfirmPassword(password: String, confirmPassword: String)->Bool{
        return password == confirmPassword
    }
    
    func onSignUpSuccess() {
        self.router?.loadLoginScreen(form: self.controller)
    }
    func passwordPattern() -> String {
        return "[a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9]"
    }
    func usernamePattern() -> String {
        return "[a-zA-Z0-9]+\\@[a-zA-Z0-9]+\\.[a-zA-Z0-9]+"
    }
}
