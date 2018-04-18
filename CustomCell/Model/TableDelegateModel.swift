//
//  TableDelegateModel.swift
//  CustomCell
//
//  Created by cpu12130-local on 4/17/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

protocol TableDelegate:class{
    func pushViewController(vc: UIViewController)
    func reloadData()
}
