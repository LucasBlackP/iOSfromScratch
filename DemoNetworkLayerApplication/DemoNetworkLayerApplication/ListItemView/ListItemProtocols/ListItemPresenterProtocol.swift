//
//  ListItemPresenterProtocol.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 5/3/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

protocol ListItemPresenterProtocol: class {
    weak var view: ListItemViewProtocol? {get set}
    var interactor: ListItemInteractorProtocol? {get set}
    var wireframe: ListItemWireframeProtocol? {get set}
    func getDataFromServer(urlSchema: Schema, urlHost: String, urlPath: String,query: [QueryItem])
    func onDataReady(data: CellForListViewModel)
    func displaySpinner(onView : UIView) -> UIView
    func removeSpinner(spinner : UIView)
    func showItemDetail(for item: ListViewModel)
}

