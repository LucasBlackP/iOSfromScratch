//
//  DetailViewInteractor.swift
//  CustomCell
//
//  Created by cpu12130-local on 4/17/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

protocol DetailViewInteractorProtocol:class{
    func initData(meal: Meal)->TableData
    func updateDesc(meal: Meal, desc: String)
    func checkView(vc:UIViewController?)
}



class DetailViewInteractor: DetailViewInteractorProtocol{
    
    
    //MARK: Properties
    weak var detailTableDelegate: DetailTableViewControllerProtocol?
    
    func initData(meal: Meal)->TableData{
        return TableData(meal: meal)
    }
    func updateDesc(meal: Meal, desc: String) {
        meal.description = desc
        self.detailTableDelegate?.reloadData()
    }
    func checkView(vc: UIViewController?) {
        if vc != nil {
            self.detailTableDelegate?.pushView(vc: vc!)
        }
    }
}
