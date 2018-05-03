//
//  ItemDetailInteractor.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 5/3/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class ItemDetailInteractor: ItemDetailInteractorProtocol{
   
    //MARK: Properties
    weak var presenter: ItemDetailPresenterProtocol?
    var item: ListViewModel?
    //MARK: Methods
    func loadDataForDisplay() {
        guard let itemForDisplay = item else{
            return
        }
        presenter?.onDataLoaded(item: itemForDisplay)
    }
    
    
}
