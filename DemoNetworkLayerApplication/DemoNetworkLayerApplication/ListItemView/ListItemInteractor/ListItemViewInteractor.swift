//
//  ListItemViewInteractor.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 4/20/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

struct QueryItem{
    var key: String
    var value: String
}

class ListItemViewInteractor: ListItemInteractorProtocol{
    weak var presenter: ListItemPresenterProtocol?
    var list = [ListViewModel]()
    var network: NetworkProtocol?
    //Load data from server
    func loadDataFromServer(urlSchema: Schema, urlHost: String, urlPath: String,query: [QueryItem]){
        network?.delegate = self
        network?.setUrlComponent(urlSchema: urlSchema, urlHost: urlHost, urlPath: urlPath)
        for item in query{
            network?.addQueryItem(keyItem: item.key, valueItem: item.value)
        }
        let request = network?.createURLRequest(method: .GET)
        let session = network?.createSession(config: .default)
        self.network?.getDataFromRequest(dataTask: (network?.createDataTask(session: session!, withUrl: request!))!)
    }
}

extension ListItemViewInteractor: NetworkLayerDelegate{
    //Network Delegate
    func onDataLoaded(data: Data?) {
        do{
            let decoder = JSONDecoder()
            self.list = try decoder.decode([ListViewModel].self, from: data!)
            let listCellConfig = CellForListViewModel(list: self.list)
            //print(self.list)
            self.presenter?.onDataReady(data: listCellConfig)
        }
        catch{
            fatalError("Couldn't parse data to Json")
        }
    }
}











