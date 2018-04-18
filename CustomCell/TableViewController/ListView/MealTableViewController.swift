//
//  TableViewController.swift
//  CustomCell
//
//  Created by cpu12130-local on 4/11/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit
class MealTableViewController: UIViewController,TableDelegate {

    //MARK: Properties
    var tableData:TableData?
    var interactor = ListViewInteractor()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         // Do any additional setup after loading the view.
        interactor.initData()
        interactor.registerCell(TableView: tableView)
        interactor.delegate = self
        self.tableView.delegate = interactor
        self.tableView.dataSource = interactor
        self.title = "Food menu"
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //PushViewDelegate
    func pushViewController(vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
    func reloadData() {
        self.tableView.reloadData()
    }
    
}









