//
//  ProfileViewController.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 5/3/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, ProfileViewControllerProtocol {

    //MARK: Properties
    @IBOutlet weak var tableProfileView: UITableView!
    var userData: ProfileTableModel?
    var interactor: ProfileInteractorProtocol?
    var wireframe: ProfileWireFrameProtocol?
    
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configVIP()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configVIP(){
        registerCell()
        self.title = "Profile"
        self.tableProfileView.dataSource = self
        self.tableProfileView.delegate = self
        self.interactor?.loadData()
    }
    func registerCell(){
        self.tableProfileView.register(UINib.init(nibName: "TitleDescriptionCell", bundle: nil), forCellReuseIdentifier: "TitleDescriptionCell")
        self.tableProfileView.register(UINib.init(nibName: "UserAvatarCell", bundle: nil), forCellReuseIdentifier: "UserAvatarCell")
        self.tableProfileView.register(UINib.init(nibName: "VideoHistoryCell", bundle: nil), forCellReuseIdentifier: "VideoHistoryCell")
    }
    func onDataLoaded(data: ProfileTableModel) {
        self.userData = data
        self.tableProfileView.reloadData()
    }

}

extension ProfileViewController: UITableViewDataSource{
    //MARK: UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return (self.userData?.configureCell.count)!
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.userData?.configureCell[section].count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = (self.userData?.configureCell[indexPath.section][indexPath.row])!
        let cell = self.tableProfileView.dequeueReusableCell(withIdentifier: type(of: item).reuseId)!
        item.configure(cell: cell)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = (self.userData?.configureCell[indexPath.section][indexPath.row])!
        let cell = self.tableProfileView.dequeueReusableCell(withIdentifier: type(of: item).reuseId)!
        return CGFloat(item.setHeight(cell: cell))
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.userData?.headers![section]
    }

    
    
}
extension ProfileViewController: UITableViewDelegate{
    //MARK: UITableViewDelegate
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
    
}














