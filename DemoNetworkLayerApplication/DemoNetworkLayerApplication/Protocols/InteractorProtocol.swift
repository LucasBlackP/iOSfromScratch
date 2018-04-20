//
//  InteractorProtocol.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 4/20/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import Foundation

protocol InteractorDelegate:class{
    func getDataFromRequest(dataTask: URLSessionDataTask)
}

protocol ListItemInteractorDelegate:class{
    func onDataReady(data: CellForListViewModel?)
    func upDateDataSource(data: CellForListViewModel?)
}
