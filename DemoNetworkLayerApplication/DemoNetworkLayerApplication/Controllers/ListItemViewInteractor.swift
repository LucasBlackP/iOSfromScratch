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

class ListItemViewInteractor{
    var list = [ListViewModel]()
    weak var interactorDelegate: InteractorDelegate?
    weak var listItemDelegate: ListItemInteractorDelegate?
    var network: NetworkProtocol?
    //Load data from server
    func loadDataFromServer(urlSchema: Schema, urlHost: String, urlPath: String,query: [QueryItem]){
        network?.delegate = self
        self.interactorDelegate = network as? InteractorDelegate
        network?.setUrlComponent(urlSchema: urlSchema, urlHost: urlHost, urlPath: urlPath)
        for item in query{
            network?.addQueryItem(keyItem: item.key, valueItem: item.value)
        }
        let request = network?.createURLRequest(method: .GET)
        let session = network?.createSession(config: .default)
        self.interactorDelegate?.getDataFromRequest(dataTask: (network?.createDataTask(session: session!, withUrl: request!))!)
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
            self.listItemDelegate?.onDataReady(data: listCellConfig)
        }
        catch{
            fatalError("Couldn't parse data to Json")
        }
    }
}

extension ListItemViewInteractor:  ListItemViewControllerDelegate{
    //List Item Controller Delegate
    func getDataFromServer(urlSchema: Schema, urlHost: String, urlPath: String,query: [QueryItem]) {
        loadDataFromServer(urlSchema: urlSchema, urlHost: urlHost, urlPath: urlPath,query: query)
    }
}

extension ListItemViewInteractor{
    //MARK: Additional function
    func displaySpinner(onView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: UIScreen.main.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let activityIndicator = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        activityIndicator.startAnimating()
        activityIndicator.center = spinnerView.center
        DispatchQueue.main.async {
            spinnerView.addSubview(activityIndicator)
            onView.addSubview(spinnerView)
        }
        return spinnerView
    }
    
    func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
}










