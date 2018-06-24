//
//  TableViewController.swift
//  CustomCell
//
//  Created by cpu12130-local on 4/11/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

protocol MealTableViewControllerProtocol:class{
    func updateData(data: MenuData?)
}


class MealTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MealTableViewControllerProtocol {

    //MARK: Properties
//    var tableData:TableData?
    var tableDataSource:MenuData?
    weak var listViewDelegate: ListViewInteractorProtocol?
    var interactor = ListViewInteractor()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Configure Views - Interactor
        configVI()
        
//        testCallPlugin()
    }
    //MARK: - Test call using plugin
    
    func testCallPlugin() {
        let authenticator = Authenticator()
        
        LoginContainer.shareInstance.register(plugin: PostLoginSuccessPlugin.self, with: UserProfilePostLoginPluginImpl())
        
        authenticator.authenticateSuccessfully()
    }
    
    //UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let data = tableDataSource else{
            return 0
        }
        return data.listMeal.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataSource!.listMeal[section].values.first!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = tableDataSource!.listMeal[indexPath.section].values.first![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId)!
        item.configure(cell: cell, cellDelegate: self, indexPath: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableDataSource!.listMeal[section].keys.first!
    }
    //UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = tableDataSource!.listMeal[indexPath.section].values.first![indexPath.row]
        let viewController  = item.pushView()!
        navigationController?.pushViewController(viewController, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //PushViewDelegate
    func pushViewController(viewController: UIViewController) {
        UIView.animate(withDuration: 9, animations: {
        })
        navigationController?.pushViewController(viewController, animated: true)
    }
    func reloadData() {
        self.tableView.reloadData()
    }
}

extension MealTableViewController{
    func registerCell(){
        let nibCell = UINib.init(nibName: "MealCell", bundle: nil)
        tableView.register(nibCell, forCellReuseIdentifier: "MealCell")
    }
    func configVI(){
        self.listViewDelegate = interactor
        self.interactor.tableViewControllerDelegate = self
        self.tableDataSource = self.listViewDelegate?.initData()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        registerCell()
        self.title = "Food menu"
    }
    func updateData(data: MenuData?) {
        self.tableDataSource = data
        reloadData()
    }
}
extension MealTableViewController: ScrollableCellDelegate{
    func cellWasDeleted(indexPath: IndexPath) {
         listViewDelegate?.deleteData(index: indexPath.row)
    }
    
    func cellWasFlagged(indexPath: IndexPath) {
        print("Flagged")
    }
    func cellWasSelected(indexPath: IndexPath) {
        tableView(tableView, didSelectRowAt: indexPath)
    }
}








