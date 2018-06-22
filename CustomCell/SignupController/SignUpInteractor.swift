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
    func signUp(username: String, password: String, confirmPassword: String)
}

class SignUpInteractor: SignUpInteractorProtocol{
    weak var controller: SignUpViewProtocol?
    func signUp(username: String, password: String, confirmPassword: String) {
        if !checkConfirmPassword(password: password, confirmPassword: confirmPassword){
            self.controller?.onLoginError(message: "Your password is wrong.")
            return
        }
        Auth.auth().createUser(withEmail: username, password: password){
            user, error in
            //Failed
            if let error = error{
                self.controller?.onLoginError(message: error.localizedDescription)
                return
            }
            //Success
            self.controller?.onSignUpSuccess()
        }
    }
    func checkConfirmPassword(password: String, confirmPassword: String)->Bool{
        if password != confirmPassword{
            return false
        }
        return true
    }
}
