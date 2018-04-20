//
//  ListItemViewInteractor.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 4/20/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit



class ListItemViewIneractor: NetworkLayerDelegate, ListItemViewControllerDelegate{
    var list = [ListViewModel]()
    weak var interactorDelegate: InteractorDelegate?
    weak var listItemDelegate: ListItemInteractorDelegate?
    var network: NetworkProtocol?
    //Load data from server
    func loadDataFromServer(){
        network?.delegate = self
        self.interactorDelegate = network as! InteractorDelegate
        network?.setUrlComponent(urlSchema: "https", urlHost: "fierce-cove-29863.herokuapp.com", urlPath: "/getAllPosts")
        let request = network?.createURLRequest(method: "GET")
        let session = network?.createSession(config: .default)
        self.interactorDelegate?.getDataFromRequest(dataTask: (network?.createDataTask(session: session!, withUrl: request!))!)
    }
    
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
    //List Item Controller Delegate
    func getDataFromServer() {
        loadDataFromServer()
    }
}

extension ListItemViewIneractor{
    //MARK: Additional function
    func displaySpinner(onView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: UIScreen.main.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
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










