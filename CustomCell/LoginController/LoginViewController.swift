//
//  LoginViewController.swift
//  CustomCell
//
//  Created by cpu12130-local on 5/29/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit
import Firebase

protocol LoginViewProtocol: class{
    var interactor: LoginInteractorProtocol?{get set}
    var user: UserAuthenticateProtocol?{get set}
    func pushView(viewController: UIViewController)
}

class LoginViewController: BaseController, ScrollPageContentProtocol, ScrollPageViewControllerProtocol {
   
    var interactor: LoginInteractorProtocol?
    var user: UserAuthenticateProtocol?
    @IBOutlet weak var txtUserName: CustomTextField!{
        didSet{
            txtUserName.formatPattern = self.interactor?.usernamePattern() ?? ""
            txtUserName.leftIcon = UIImage(named: "email")
        }
    }
    @IBOutlet weak var txtPassword: CustomTextField!{
        didSet{
            
            txtPassword.isSecureTextEntry = true
            txtPassword.formatPattern = self.interactor?.passwordPattern() ?? ""
            txtPassword.leftIcon = UIImage(named: "password")
        }
    }
    @IBOutlet weak var btnLogin: RadiusButton!
    @IBOutlet weak var txtErrorMessage: UILabel!{
        didSet{
            
            txtErrorMessage.textColor = .red
        }
    }

    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Login"
        configureView()
    }
    
    //MARK: Configuration
    func configureView(){
        txtUserName.customDelegate = self
        txtPassword.customDelegate = self
        user?.delegate = self
    }
    
    func config(contentModel: PageContentModel?) {
    }
    
    //MARK: Logic
    @IBAction func signUp(_ sender: UIButton) {
       interactor?.signUp()
    }

    @IBAction func login(_ sender: UIButton) {
        btnLogin.setTitle("", for: .normal)
        btnLogin.showIndicator()
        interactor?.login(username: txtUserName.text!, password: txtPassword.text!)
    }
    
    func stopIndicator(){
        btnLogin.setTitle("Login", for: .normal)
        btnLogin.removeIndicator()
    }
    
    func nextPage() -> Bool {
        return false
    }
}
extension LoginViewController: LoginViewProtocol{    
    func pushView(viewController: UIViewController) {
        stopIndicator()
    }
}

extension LoginViewController: UserAuthenticateDelegate{
    
    func onAuthenticateSuccess() {
        stopIndicator()
        interactor?.onLoginSuccess()
    }
    func onAuthenticateError(message: String) {
        txtErrorMessage.text = message
        stopIndicator()
    }
}

extension LoginViewController: CustomTextFieldDelegate{
    
    //Handle event user press return after edited textfield
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    //Handle event user begin editting textfield
    func textFieldDidBeginEditing(_ textField: UITextField) {
        txtErrorMessage.text = ""
    }
    //Handle event textfield empty
    func onTextFieldEmpty(_ textField: CustomTextField) {
        textField.rightIcon = nil
        switch (txtUserName.verifyState, txtPassword.verifyState){
        case (CustomTextField.VerifyState.empty, CustomTextField.VerifyState.empty):
            btnLogin.backgroundColor = RadiusButton.disableColor
            btnLogin.isEnabled = false
        default:
            break
        }
    }
    //Handle event textfield changed its text
    func onTextFieldDidChangedText(_ textField: CustomTextField) {
        textField.isShowPassword = true
        if(textField.text?.count != 0){
            btnLogin.isEnabled = true
             btnLogin.backgroundColor = RadiusButton.defaultColor
        }
    }
   
}


