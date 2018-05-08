//
//  ProfilePresenter.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 5/8/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class ProfilePresenter: ProfilePresenterProtocol{
    var viewController: ProfileViewControllerProtocol?
    
    func onDataLoaded(data: ProfileTableModel) {
        viewController?.onDataLoaded(data: data)
    }
    
}
