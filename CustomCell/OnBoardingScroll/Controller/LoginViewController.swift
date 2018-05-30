//
//  LoginViewController.swift
//  CustomCell
//
//  Created by cpu12130-local on 5/29/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, ScrollPageContentProtocol, ScrollPageViewControllerProtocol {
   
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
        self.title = "Login"

        // Do any additional setup after loading the view.
    }
    
    func nextPage() -> Bool {
        return false
    }
    
    func config(contentModel: PageContentModel?) {
    }
    
    @IBAction func login(_ sender: UIButton) {
        let tableView = MealTableViewController()
        let navTableView = UINavigationController()
        navTableView.addChildViewController(tableView)
        self.view.window?.rootViewController = navTableView
//        present(navTableView, animated: true, completion: nil)
//        self.view.willRemoveSubview(self.view)
    }
}
