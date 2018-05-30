//
//  OnBoardingScrollInteractor.swift
//  CustomCell
//
//  Created by cpu12130-local on 5/25/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

protocol OnBoardingScrollPresenterProtocol: class {
    var interactor: OnBoardingScrollInteractorProtocol?{get set}
    var controller: OnBoardingScrollViewProtocol?{get set}
    func loadOnBoardingPages()->[ScrollPageContentProtocol]
}

class OnBoardingScrollPresenter: OnBoardingScrollPresenterProtocol{
    
    var interactor: OnBoardingScrollInteractorProtocol?
    weak var controller: OnBoardingScrollViewProtocol?
    func loadOnBoardingPages() -> [ScrollPageContentProtocol] {
        guard let retData = interactor?.loadScrollPage() else{
            return []
        }
        return retData
    }
}
