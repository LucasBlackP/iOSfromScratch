//
//  OnBoardingRouter.swift
//  CustomCell
//
//  Created by cpu12130-local on 5/22/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit
class OnBoardingRouter{
    static func configureVIPER()->UIViewController {
        let controller = OnBoardingViewController()
        let presenter = OnBoardingPresenter()
        let interactor = OnBoardingInteractor()
        controller.presenter = presenter
        presenter.controller = controller
        presenter.interactor = interactor
        interactor.presenter = presenter
        return controller
    }
}
