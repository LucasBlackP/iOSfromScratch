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
    var network: NetworkProtocol?{get set}
    weak var presenter: ListItemPresenterProtocol?{get set}
    func loadDataFromServer(urlSchema: Schema, urlHost: String, urlPath: String,query: [QueryItem])
}

