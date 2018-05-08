//
//  ProfileConfigurator.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 5/8/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class ProfileConfigurator: ProfileConfiguratorProtocol{
    static func config() -> UIViewController {
        let viewController = ProfileViewController()
        let interactor = ProfileInteractor()
        let presenter = ProfilePresenter()
        let wireframe = ProfileWireframe()
        viewController.interactor = interactor
        viewController.wireframe = wireframe
        interactor.networkLayer = NetworkLayer.sharedInstance
        interactor.presenter = presenter
        presenter.viewController = viewController
        return viewController
    }
    
    static func config(viewController: ProfileViewControllerProtocol) {
        let interactor = ProfileInteractor()
        let presenter = ProfilePresenter()
        let wireframe = ProfileWireframe()
        viewController.interactor = interactor
        viewController.wireframe = wireframe
        interactor.networkLayer = NetworkLayer.sharedInstance
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    
    
    
}
