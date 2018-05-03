//
//  InteractorProtocol.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 4/20/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

protocol ListItemInteractorProtocol:class {
    var list:[ListViewModel]{get set}
    weak var interactorDelegate: InteractorNetworkDelegate?{get set}
    weak var listItemDelegate: InteractorListItemDelegate?{get set}
    var network: NetworkProtocol?{get set}
    
}

protocol InteractorNetworkDelegate:class{
    func getDataFromRequest(dataTask: URLSessionDataTask)
}

protocol InteractorListItemDelegate:class{
    func onDataReady(data: CellForListViewModel?)
    func upDateDataSource(data: CellForListViewModel?)
}
