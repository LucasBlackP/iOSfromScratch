//
//  MasterScrollPresenter.swift
//  CustomCell
//
//  Created by cpu12130-local on 5/29/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

protocol MasterScrollPresenterProtocol: class {
    var interactor: MasterScrollInteractorProtocol?{get set}
    var controller: MasterScrollViewProtocol?{get set}
    func loadOnBoardingPages()->[UIViewController]
}

class MasterScrollPresenter: MasterScrollPresenterProtocol{
    
    var interactor: MasterScrollInteractorProtocol?
    weak var controller: MasterScrollViewProtocol?
    func loadOnBoardingPages() -> [UIViewController] {
        guard let retData = interactor?.loadScrollPage() else{
            return []
        }
        return retData
    }
}
