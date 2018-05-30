//
//  MasterScrollRouter.swift
//  CustomCell
//
//  Created by cpu12130-local on 5/29/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class MasterScrollRouter{
    static func configureVIPER() -> UIViewController{
        let controller = MasterScrollViewController()
        let presenter = MasterScrollPresenter()
        let interactor = MasterScrollInteractor()
        controller.presenter = presenter
        presenter.controller = controller
        presenter.interactor = interactor
        interactor.presenter = presenter
        return controller
    }
}
