//
//  LoginRouter.swift
//  CustomCell
//
//  Created by cpu12130-local on 6/21/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

protocol LoginRouterProtocol{
    static func configure()->UIViewController
    static func loadView()->UIViewController
    func loadSignUpScreen(from: LoginViewProtocol?)
    func loadMenuScreen(from: LoginViewProtocol?)
}

class LoginRouter: LoginRouterProtocol{
    static func configure()->UIViewController{
        let loginController = LoginViewController()
        let loginInteractor = LoginInteractor()
        let router = LoginRouter()
        loginController.user = UserAuthenticate()
        loginController.interactor = loginInteractor
        loginInteractor.loginController = loginController
        loginInteractor.router = router
        return loginController
    }
    static func loadView()->UIViewController{
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
        return tabbarController
    }
    func loadSignUpScreen(from view: LoginViewProtocol?) {
        guard let view = view as? UIViewController else{
            return
        }
        guard let navController = view.navigationController else{
            let navController = UINavigationController(rootViewController: view)
            navController.pushViewController(SignUpRouter.configure(), animated: true)
            view.view.window?.rootViewController = navController
            return
        }
        navController.pushViewController(SignUpRouter.configure(), animated: true)
    }
    func loadMenuScreen(from view: LoginViewProtocol?) {
        guard let view = view as? UIViewController else{
            return
        }
        view.view.window?.rootViewController = LoginRouter.loadView()
    }
}
