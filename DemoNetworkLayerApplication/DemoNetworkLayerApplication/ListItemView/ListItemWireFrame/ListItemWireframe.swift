//
//  ListItemWireframe.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 5/3/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class ListItemWireframe: ListItemWireframeProtocol{
   
    
    static func createListItemModule() -> UIViewController {
        let navController = UINavigationController()
        let view = ListItemViewController()
        let presenter = ListItemPresenter()
        let interactor = ListItemViewInteractor()
        let wireframe = ListItemWireframe()
        navController.viewControllers = [view]
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.view = view
        presenter.wireframe = wireframe
        interactor.network = NetworkLayer.sharedInstance
        interactor.presenter = presenter
        return navController
    }
    
    func createDetailScreen(from view: ListItemViewProtocol, with item: ListViewModel) {
        guard let viewController = view as? UIViewController else{
            return
        }
        let detailView = ItemDetailWireframe.createItemDetailModule(for: item)
        viewController.navigationController?.pushViewController(detailView, animated: true)
    }

}
