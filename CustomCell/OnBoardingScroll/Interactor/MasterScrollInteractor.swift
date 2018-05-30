//
//  MasterScrollInteractor.swift
//  CustomCell
//
//  Created by cpu12130-local on 5/29/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit
protocol MasterScrollInteractorProtocol: class{
    var presenter: MasterScrollPresenterProtocol?{get set}
    func loadScrollPage()->[UIViewController]
}
class MasterScrollInteractor: MasterScrollInteractorProtocol{
    weak var presenter: MasterScrollPresenterProtocol?
    func loadScrollPage() -> [UIViewController] {
        let page1 = GetStartedViewController()
        let page2 = OnBoardingScrollRouter.configureVIPER()
        let page3 = LoginViewController()
        return [page1,page2,page3]
    }
}
