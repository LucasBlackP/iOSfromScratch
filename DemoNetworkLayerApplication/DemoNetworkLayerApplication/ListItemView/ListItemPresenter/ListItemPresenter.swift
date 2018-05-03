//
//  ListItemPresenter.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 5/3/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class ListItemPresenter: ListItemPresenterProtocol{
    //MARK: Properties
    weak var view: ListItemViewProtocol?
    var interactor: ListItemInteractorProtocol?
    var wireframe: ListItemWireframeProtocol?
    
    func getDataFromServer(urlSchema: Schema, urlHost: String, urlPath: String, query: [QueryItem]) {
        interactor?.loadDataFromServer(urlSchema: urlSchema, urlHost: urlHost, urlPath: urlPath, query: query)
    }
    
    func onDataReady(data: CellForListViewModel) {
        view?.onDataReady(data: data)
    }
    
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
    func showItemDetail(for item: ListViewModel) {
        wireframe?.createDetailScreen(from: view!, with: item)
    }
    
}
