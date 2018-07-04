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
    var userAuthentication: UserAuthenticateProtocol?{get set}
    var interactor: SignUpInteractorProtocol?{get set}
}

class SignUpViewController: BaseController, SignUpViewProtocol {
    var interactor: SignUpInteractorProtocol?
    var userAuthentication: UserAuthenticateProtocol?
    @IBOutlet weak var txtEmail: CustomTextField!{
        didSet{
            txtEmail.formatPattern = interactor?.usernamePattern() ?? ""
            txtEmail.leftIcon = UIImage(named: "email")
        }
    }
    @IBOutlet weak var txtPassword: CustomTextField!{
        didSet{
            txtPassword.isSecureTextEntry = true
            txtPassword.formatPattern = interactor?.passwordPattern() ?? ""
            txtPassword.leftIcon = UIImage(named: "password")
        }
    }
    @IBOutlet weak var txtConfirmPassword: CustomTextField!{
        didSet{
            txtConfirmPassword.isSecureTextEntry = true
            txtConfirmPassword.formatPattern = interactor?.passwordPattern() ?? ""
            txtConfirmPassword.leftIcon = UIImage(named: "password")
        }
    }
    @IBOutlet weak var btnSignUp: RadiusButton!
    @IBOutlet weak var txtErrorMessage: UILabel!{
        didSet{
            txtErrorMessage.textColor = .red
        }
    }
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Sign Up"
        configureView()
    }

    //MARK: Configuration
    func configureView(){
        txtEmail.customDelegate = self
        txtPassword.customDelegate = self
        txtConfirmPassword.customDelegate = self
        userAuthentication?.delegate = self
    }
    func stopIndicator(){
        btnSignUp.removeIndicator()
        btnSignUp.setTitle("Sign up", for: .normal)
    }
    //MARK: IBActions
    @IBAction func signUp(_ sender: UIButton) {
        btnSignUp.showIndicator()
        btnSignUp.setTitle("", for: .normal)
        interactor?.signUp(username: txtEmail.text!, password: txtPassword.text!, confirmPassword: txtConfirmPassword.text!)
    }

   
}

extension SignUpViewController: CustomTextFieldDelegate{
    
    //Handle event user press return after edited textfield
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    //Handle event user begin editting textfield
    func textFieldDidBeginEditing(_ textField: UITextField) {
        txtErrorMessage.text = ""
    }
    
    //Handle event textfield changed its text
    func onTextFieldDidChangedText(_ textField: CustomTextField) {
        switch(txtEmail.verifyState,txtPassword.verifyState,txtConfirmPassword.verifyState){
        case (CustomTextField.VerifyState.hasText,CustomTextField.VerifyState.hasText,CustomTextField.VerifyState.hasText):
            btnSignUp.isEnabled = true
            btnSignUp.backgroundColor = RadiusButton.defaultColor
        default:
            break
        }
    }
    
    //Handle event textfield empty
    func onTextFieldEmpty(_ textField: CustomTextField) {
        btnSignUp.isEnabled = false
        btnSignUp.backgroundColor = RadiusButton.disableColor
    }
}

extension SignUpViewController: UserAuthenticateDelegate{
    func onAuthenticateSuccess() {
        stopIndicator()
        showPopup(config: PopupConfiguration(title: "Sign in successfully", message: "Let's login"), handler: {
            self.interactor?.onSignUpSuccess()
        })
    }
    func onAuthenticateError(message: String) {
        stopIndicator()
        txtErrorMessage.text = message
    }
}
