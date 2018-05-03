//
//  ItemDetailPresenter.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 5/3/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class ItemDetailPresenter: ItemDetailPresenterProtocol{
    //MARK: Properties
    weak var view: ItemDetailViewProtocol?
    var interactor: ItemDetailInteractorProtocol?
    var wireframe: ItemDetailWireframeProtocol?
    //MARK: Methods
    func displayDetail() {
        interactor?.loadDataForDisplay()
    }
    func onDataLoaded(item: ListViewModel) {
        view?.showDetailView(for: item)
    }
    
}
