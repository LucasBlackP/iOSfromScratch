//
//  MailListController.swift
//  CustomCell
//
//  Created by cpu12130-local on 5/30/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class MailListController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let nib = UINib.init(nibName: "ScrollCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ScrollCell")
        tableView.dataSource = self
        
    }
}
extension MailListController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScrollCell") as! ScrollCell
        cell.configure(data: "Meal "+"\(indexPath.row)")
        return cell
    }
}
extension MailListController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
}
