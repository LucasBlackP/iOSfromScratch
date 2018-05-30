//
//  OnBoardingScrollRouter.swift
//  CustomCell
//
//  Created by cpu12130-local on 5/25/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class OnBoardingScrollRouter{
    static func configureVIPER() -> UIViewController{
        let controller = OnBoardingScrollViewController()
        let presenter = OnBoardingScrollPresenter()
        let interactor = OnBoardingScrollInteractor()
        controller.presenter = presenter
        presenter.controller = controller
        presenter.interactor = interactor
        interactor.presenter = presenter
        return controller
    }
}
