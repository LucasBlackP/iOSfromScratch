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
        let tabbarController = UITabBarController()
        let homeController = MealTableViewController()
        let navTableView = UINavigationController(rootViewController: homeController)
        let chartController = TopChartsViewController()
        let tagController = SearchViewController()
        let userController = ProfileViewController()
        navTableView.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home")!, tag: 1)
        chartController.tabBarItem = UITabBarItem(title: "Charts", image: UIImage(named: "charts")!, tag: 2)
        tagController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "search")!, tag: 3)
        userController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile")!, tag: 4)
        tabbarController.viewControllers = [navTableView,chartController,tagController,userController]
        self.view.window?.rootViewController = tabbarController

    }
}
