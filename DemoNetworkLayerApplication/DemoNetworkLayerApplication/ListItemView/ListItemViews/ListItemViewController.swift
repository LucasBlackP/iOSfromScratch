//
//  ListItemViewController.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 4/20/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit



class ListItemViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    var listData: CellForListViewModel?
    weak var controllerDelegate: ListItemViewControllerDelegate?
    var spinner: UIView?
    var interactor = ListItemViewInteractor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Confifure View - Interactor
        configureVI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ListItemViewController:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = listData else{
            return 0
        }
        return data.data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = listData!.data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId)!
        item.configure(cell: cell)
        return cell
    }
}
extension ListItemViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
extension ListItemViewController: InteractorListItemDelegate{
    //List Item Interactor Delegate
    func onDataReady(data: CellForListViewModel?) {
        self.listData = data
        self.tableView.reloadData()
        self.interactor.removeSpinner(spinner: spinner!)
    }
    func updateDataSource(data: CellForListViewModel?) {
        self.listData = data
        spinner = interactor.displaySpinner(onView: self.view)
        self.tableView.reloadData()
        self.interactor.removeSpinner(spinner: spinner!)
    }
}
extension ListItemViewController{
    //MARK: Additional function
    func configureVI(){
        self.controllerDelegate = interactor
        interactor.listItemDelegate = self
        interactor.network = NetworkLayer.sharedInstance
        spinner = interactor.displaySpinner(onView: self.view)
        self.controllerDelegate?.getDataFromServer(urlSchema: .https, urlHost: "fierce-cove-29863.herokuapp.com", urlPath: "/getAllPosts", query: [])
        self.tableView.delegate = self
        self.tableView.dataSource = self
        registerCell()
    }
    func registerCell(){
        let nib = UINib.init(nibName: "ItemCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ItemCell")
    }
}
