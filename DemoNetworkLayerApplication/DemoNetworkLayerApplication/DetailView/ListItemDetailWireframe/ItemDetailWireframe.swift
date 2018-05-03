//
//  ItemDetailWireframe.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 5/3/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class ItemDetailWireframe: ItemDetailWireframeProtocol{
    static func createItemDetailModule(for item: ListViewModel) -> UIViewController {
        let view = ItemDetailViewController()
        let presenter = ItemDetailPresenter()
        let interactor = ItemDetailInteractor()
        let wireframe = ItemDetailWireframe()
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.view = view
        presenter.wireframe = wireframe
        interactor.presenter = presenter
        interactor.item = item
        return view
    }
    
}
