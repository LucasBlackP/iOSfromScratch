//
//  ProfileProtocol.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 5/8/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

protocol ProfileViewControllerProtocol: class{
    var wireframe: ProfileWireFrameProtocol? {get set}
    var interactor: ProfileInteractorProtocol? {get set}
    func onDataLoaded(data: ProfileTableModel)
}

protocol ProfileInteractorProtocol: class{
    var presenter: ProfilePresenterProtocol? {get set}
    var networkLayer: NetworkProtocol? {get set}
    func loadData()
}

protocol ProfilePresenterProtocol: class {
    weak var viewController: ProfileViewControllerProtocol? {get set}
    func onDataLoaded(data: ProfileTableModel)
}

protocol ProfileWireFrameProtocol: class {
    weak var viewController: ProfileViewControllerProtocol? {get set}
    
}

protocol ProfileConfiguratorProtocol: class{
    static func config() -> UIViewController
    static func config(viewController: ProfileViewControllerProtocol)
}
