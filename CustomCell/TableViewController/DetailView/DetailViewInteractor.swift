//
//  DetailViewInteractor.swift
//  CustomCell
//
//  Created by cpu12130-local on 4/17/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class DetailViewInteractor: UIViewController, UITableViewDelegate, UITableViewDataSource, DescriptionDelegate{
    
    //MARK: Properties
    var tableData: TableData?
    var meal: Meal?
    weak var delegate: TableDelegate?
    //UITableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableData!.data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData!.data[section].values.first!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = tableData!.data[indexPath.section].values.first![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId)!
        item.configure(cell: cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableData!.data[section].keys.first!
    }
    //UITableViewDataSource
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = tableData!.data[indexPath.section].values.first![indexPath.row]
        let vc  = item.pushView()
        if let a = vc as? EditDescriptionController{
            a.descDelegate = self
        }
        if vc != nil{
            self.delegate?.pushViewController(vc: vc!)
        }
    }
    
    //Additional function
    func registerCell(table tableView: UITableView){
        var nibCell = UINib.init(nibName: "DetailCell", bundle: nil)
        tableView.register(nibCell, forCellReuseIdentifier: "DetailCell")
        nibCell = UINib.init(nibName: "DescriptionCell", bundle: nil)
        tableView.register(nibCell, forCellReuseIdentifier: "DescriptionCell")
        nibCell = UINib.init(nibName: "AuthorCell", bundle: nil)
        tableView.register(nibCell, forCellReuseIdentifier: "AuthorCell")
        nibCell = UINib.init(nibName: "IngredientCell", bundle: nil)
        tableView.register(nibCell, forCellReuseIdentifier: "IngredientCell")
        nibCell = UINib.init(nibName: "MealCell", bundle: nil)
        tableView.register(nibCell, forCellReuseIdentifier: "MealCell")
    }
    
    func initData(){
        tableData = TableData(meal: meal!)
    }
    func updateDesc(data: String) {
        self.meal?.description = data
        tableData = TableData(meal: meal!)
        self.delegate?.reloadData()
    }
}
