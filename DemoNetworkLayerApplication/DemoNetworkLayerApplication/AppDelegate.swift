//
//  AppDelegate.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 4/20/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let tabbarController = UITabBarController()
        let listController = ListItemWireframe.createListItemModule()
        let topChartController = TopChartViewController()
        let searchController = SearchViewController()
        let profileController = ProfileConfigurator.config()
        window = UIWindow(frame: UIScreen.main.bounds)
        listController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 1)
        topChartController.tabBarItem = UITabBarItem(title: "Charts", image: UIImage(named: "chart"), tag: 2)
        searchController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "search"), tag: 3)
        profileController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile"), tag: 4)
        tabbarController.viewControllers = [listController,topChartController,searchController,profileController]
        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

