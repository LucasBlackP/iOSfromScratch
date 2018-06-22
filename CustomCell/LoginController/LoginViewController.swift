//
//  LoginViewController.swift
//  CustomCell
//
//  Created by cpu12130-local on 5/29/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit
import Firebase
import MBProgressHUD

protocol LoginViewProtocol: class{
    var interactor: LoginInteractorProtocol?{get set}
    func onLoginError(message: String)
    func onLoginSuccess(viewController: UIViewController)
    func pushView(viewController: UIViewController)
}

class LoginViewController: UIViewController, ScrollPageContentProtocol, ScrollPageViewControllerProtocol {
   
    var interactor: LoginInteractorProtocol?
    var indicator: UIActivityIndicatorView!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!{
        didSet{
            txtPassword.isSecureTextEntry = true
        }
    }
    @IBOutlet weak var btnLogin: UIButton!{
        didSet{
            btnLogin.clipsToBounds = true
            btnLogin.layer.masksToBounds = true
            btnLogin.layer.cornerRadius = btnLogin.frame.height/2.0
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Login"
        
    }
    override func viewDidLayoutSubviews() {
        configureView()
    }
    func nextPage() -> Bool {
        return false
    }
    
    func config(contentModel: PageContentModel?) {
    }
    
    @IBAction func signUp(_ sender: UIButton) {
       interactor?.signUp()
    }

    @IBAction func login(_ sender: UIButton) {
        indicator.startAnimating()
        btnLogin.titleLabel?.isHidden = true
        interactor?.login(username: txtUserName.text!, password: txtPassword.text!)
    }
    func configureView(){
        indicator = HUB.createIndicator(for: btnLogin)
        self.view.addSubview(indicator)
    }
    func stopIndicator(){
        indicator.stopAnimating()
        btnLogin.titleLabel?.isHidden = false
    }
   
}
extension LoginViewController: LoginViewProtocol{
    func onLoginError(message: String) {
        stopIndicator()
        print(message)
    }
    func onLoginSuccess(viewController: UIViewController) {
        stopIndicator()
        self.view.window?.rootViewController = viewController
    }
    func pushView(viewController: UIViewController) {
        stopIndicator()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
