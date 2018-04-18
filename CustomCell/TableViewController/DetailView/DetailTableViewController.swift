//
//  DetailTableViewController.swift
//  CustomCell
//
//  Created by cpu12130-local on 4/11/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class DetailTableViewController: UIViewController, TableDelegate {
   
    //MARK: Properties
    var meal: Meal?
    var interactor = DetailViewInteractor()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        interactor.meal = self.meal
        interactor.delegate = self
        interactor.initData()
        interactor.registerCell(table:  tableView)
        self.tableView.delegate = interactor
        self.tableView.dataSource = interactor
        self.title = "Meal Detail"
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    func pushViewController(vc: UIViewController) {
            navigationController?.pushViewController(vc, animated: true)
    }

}



