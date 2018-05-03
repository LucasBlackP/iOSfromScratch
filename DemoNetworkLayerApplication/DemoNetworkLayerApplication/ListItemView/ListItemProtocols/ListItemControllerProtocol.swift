//
//  ListItemControllerProtocol.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 4/20/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

protocol ListItemViewProtocol: class{
    var presenter: ListItemPresenterProtocol{get set}
    func onDataReady(data: CellForListViewModel?)
    func updateDataSource(data: CellForListViewModel?)
}

protocol ListItemViewControllerDelegate: class{
    func getDataFromServer(urlSchema: Schema, urlHost: String, urlPath: String,query: [QueryItem])
}
