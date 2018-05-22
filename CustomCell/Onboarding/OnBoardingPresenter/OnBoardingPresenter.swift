//
//  OnBoardingPresenter.swift
//  CustomCell
//
//  Created by cpu12130-local on 5/22/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

protocol OnBoardingPresenterProtocol: class{
    var controller: OnBoardingViewControllerProtocol?{get set}
    var interactor: OnBoardingInteractorProtocol?{get set}
    func nextPageContent(index: Int) -> PageContentViewProtocol?
    func previousPageContent(index: Int) -> PageContentViewProtocol?
    func numberOfPage()->Int
    func loadData()
    func firstPage()->PageContentViewProtocol?
}

class OnBoardingPresenter: OnBoardingPresenterProtocol{
    //MARK: Properties
    var interactor: OnBoardingInteractorProtocol?
    weak var controller: OnBoardingViewControllerProtocol?
    //MARK: Methods
    func nextPageContent(index: Int) -> PageContentViewProtocol? {
        return interactor?.loadNextPageContent(index: index)
    }
    
    func previousPageContent(index: Int) -> PageContentViewProtocol? {
        return interactor?.loadPreviousPageContent(index: index)
    }
    
    func numberOfPage() -> Int {
        return (interactor?.numberOfPage())!
    }
    func loadData() {
        self.interactor?.loadData()
    }
    func firstPage() -> PageContentViewProtocol? {
        return self.interactor?.firstPage()
    }
    
}


