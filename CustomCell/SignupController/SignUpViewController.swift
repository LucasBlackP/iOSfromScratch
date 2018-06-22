//
//  SignUpViewController.swift
//  CustomCell
//
//  Created by cpu12130-local on 6/21/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit
import Firebase

protocol SignUpViewProtocol: class{
    var interactor: SignUpInteractorProtocol?{get set}
    func onLoginError(message: String)
    func onSignUpSuccess()
}

class SignUpViewController: UIViewController {
    var interactor: SignUpInteractorProtocol?
    var indicator: UIActivityIndicatorView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!{
        didSet{
            txtPassword.isSecureTextEntry = true
        }
    }
    @IBOutlet weak var txtConfirmPassword: UITextField!{
        didSet{
            txtConfirmPassword.isSecureTextEntry = true
        }
    }
    @IBOutlet weak var btnSignUp: UIButton!{
        didSet{
            btnSignUp.clipsToBounds = true
            btnSignUp.layer.masksToBounds = true
            btnSignUp.layer.cornerRadius = btnSignUp.frame.height/4
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Sign Up"
    }
    override func viewDidLayoutSubviews() {
        configureView()
    }
    @IBAction func signUp(_ sender: UIButton) {
        indicator.startAnimating()
        interactor?.signUp(username: txtEmail.text!, password: txtPassword.text!, confirmPassword: txtConfirmPassword.text!)
    }
    func configureView(){
        indicator = HUB.createIndicator(for: btnSignUp)
        self.view.addSubview(indicator)
    }
   
}
extension SignUpViewController: SignUpViewProtocol{
    func onLoginError(message: String) {
        indicator.stopAnimating()
        print(message)
    }
    func onSignUpSuccess() {
        indicator.stopAnimating()
        navigationController?.popToRootViewController(animated: true)
    }
}
