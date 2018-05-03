//
//  ItemDetailPresenterProtocol.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 5/3/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

protocol  ItemDetailPresenterProtocol: class {
    weak var view: ItemDetailViewProtocol? {get set}
    var interactor: ItemDetailInteractorProtocol?{get set}
    var wireframe: ItemDetailWireframeProtocol?{get set}
    func displayDetail()
    func onDataLoaded(item: ListViewModel)
}
