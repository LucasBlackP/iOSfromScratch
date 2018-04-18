//
//  DetailTableViewController.swift
//  CustomCell
//
//  Created by cpu12130-local on 4/11/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

protocol DetailTableViewControllerProtocol:class{
   func reloadData()
    func pushView(vc: UIViewController)
}

class DetailTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    //MARK: Properties
    var meal: Meal?
    var tableData: TableData?
    var interactor = DetailViewInteractor()
    weak var detailInteractorDelegate: DetailViewInteractorProtocol?
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Methods
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        //Configure Views - Interactor
        configVI()
        
        
    }
    
    //UITableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let dataOfTable = tableData else{
            return 0;
        }
        return dataOfTable.data.count
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
        self.detailInteractorDelegate?.checkView(vc: vc)
        
    }
}
extension DetailTableViewController: DescriptionDelegate{
    func updateDesc(data: String) {
        self.detailInteractorDelegate?.updateDesc(meal: meal!, desc: data)
    }
}
extension DetailTableViewController: DetailTableViewControllerProtocol{
    func reloadData() {
        tableData = self.detailInteractorDelegate?.initData(meal: meal!)
        tableView.reloadData()
    }
    func pushView(vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension DetailTableViewController{
    func configVI(){
        detailInteractorDelegate = interactor
        interactor.detailTableDelegate = self
        tableData = self.detailInteractorDelegate?.initData(meal: meal!)
        registerCell()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.title = "Meal Detail"
    }
    func registerCell(){
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
}





