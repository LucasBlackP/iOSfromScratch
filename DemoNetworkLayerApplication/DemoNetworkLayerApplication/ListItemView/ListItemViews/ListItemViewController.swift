//
//  ListItemViewController.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 4/20/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit



class ListItemViewController: UIViewController, ListItemViewProtocol {
    
    //MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    var listData: CellForListViewModel?
    var spinner: UIView?
    var presenter: ListItemPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Confifure View - Interactor
        configureVP()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func onDataReady(data: CellForListViewModel?) {
        self.listData = data
        self.tableView.reloadData()
        self.presenter?.removeSpinner(spinner: spinner!)
    }
    func updateDataSource(data: CellForListViewModel?) {
        self.listData = data
        spinner = presenter?.displaySpinner(onView: self.view)
        self.tableView.reloadData()
        self.presenter?.removeSpinner(spinner: spinner!)
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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = listData!.data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId)!
        return CGFloat(item.setHeight(cell: cell))
        
    }

}
extension ListItemViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showItemDetail(for: (listData?.listItem![indexPath.row])!)
    }
}

extension ListItemViewController{
    //MARK: Additional function
    func configureVP(){
        self.title = "List View"
        spinner = presenter?.displaySpinner(onView: self.view)
        self.presenter?.getDataFromServer(urlSchema: .https, urlHost: "fierce-cove-29863.herokuapp.com", urlPath: "/getAllPosts", query: [])
        self.tableView.delegate = self
        self.tableView.dataSource = self
        registerCell()
    }
    func registerCell(){
        let nib = UINib.init(nibName: "ItemCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ItemCell")
    }
}
