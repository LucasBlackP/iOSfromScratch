//
//  ListViewInteractor.swift
//  CustomCell
//
//  Created by cpu12130-local on 4/17/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class ListViewInteractor: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    //MARK: Properties
    var tableDataSource:MenuData?
    weak var delegate:TableDelegate?
    //UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableDataSource!.listMeal.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataSource!.listMeal[section].values.first!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = tableDataSource!.listMeal[indexPath.section].values.first![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId)!
        item.configure(cell: cell)
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableDataSource!.listMeal[section].keys.first!
    }
    //UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = tableDataSource!.listMeal[indexPath.section].values.first![indexPath.row]
        let vc  = item.pushView()!
        self.delegate?.pushViewController(vc: vc)
    }
    
    
}
extension ListViewInteractor{
    func registerCell(TableView tableView: UITableView){
        let nibCell = UINib.init(nibName: "MealCell", bundle: nil)
        tableView.register(nibCell, forCellReuseIdentifier: "MealCell")
    }
    func initData(){
        var tableData = [Meal]()
        tableData.append(Meal(name: "Meal1", photo: UIImage(named:"Image-1")!, description:
            """
            Boil water and salt in a pot with a lid.
            Mix maize meal with cold water.
            Stir into the boiling water.
            Simmer for at least 30 minutes with the lid on.
            Add a dollop of butter.
            Serve with milk and sugar or honey.
            """, ingredients: ["Sugar","Salt"],percent: [50,50],author: "David Micheal"))
        tableData.append(Meal(name: "Meal2", photo: UIImage(named:"Image-2")!, description: """
            Boil water and salt in a pot with a lid.
            Mix maize meal with cold water.
            Stir into the boiling water.
            Simmer for at least 30 minutes with the lid on.
            Add a dollop of butter.
            Serve with milk and sugar or honey.
            """, ingredients: ["Sugar","Salt"],percent: [50,50],author: "David Micheal"))
        tableData.append(Meal(name: "Meal3", photo: UIImage(named:"Image-3")!, description: """
            Boil water and salt in a pot with a lid.
            Mix maize meal with cold water.
            Stir into the boiling water.
            Simmer for at least 30 minutes with the lid on.
            Add a dollop of butter.
            Serve with milk and sugar or honey.
            """, ingredients: ["Sugar","Salt"],percent: [70,30],author: "David Micheal"))
        tableData.append(Meal(name: "Meal4", photo: UIImage(named:"Image-4")!, description: """
            Boil water and salt in a pot with a lid.
            Mix maize meal with cold water.
            Stir into the boiling water.
            Simmer for at least 30 minutes with the lid on.
            Add a dollop of butter.
            Serve with milk and sugar or honey.
            """, ingredients: ["Honey","Cream"],percent: [10,90],author: "David Micheal"))
        tableData.append(Meal(name: "Meal5", photo: UIImage(named:"Image-5")!, description: """
            Boil water and salt in a pot with a lid.
            Mix maize meal with cold water.
            Stir into the boiling water.
            Simmer for at least 30 minutes with the lid on.
            Add a dollop of butter.
            Serve with milk and sugar or honey.
            """, ingredients: ["Salt","Water"],percent: [50,50],author: "David Micheal"))
        tableData.append(Meal(name: "Meal6", photo: UIImage(named:"Image-6")!, description: """
            Boil water and salt in a pot with a lid.
            Mix maize meal with cold water.
            Stir into the boiling water.
            Simmer for at least 30 minutes with the lid on.
            Add a dollop of butter.
            Serve with milk and sugar or honey.
            """, ingredients: ["Honey","Cream"],percent: [50,50],author: "David Micheal"))
        tableData.append(Meal(name: "Meal7", photo: UIImage(named:"Image-7")!, description: """
            Boil water and salt in a pot with a lid.
            Mix maize meal with cold water.
            Stir into the boiling water.
            Simmer for at least 30 minutes with the lid on.
            Add a dollop of butter.
            Serve with milk and sugar or honey.
            """, ingredients: ["Sugar","Salt"],percent: [50,50],author: "David Micheal"))
        tableData.append(Meal(name: "Meal8", photo: UIImage(named:"Image-8")!, description: """
            Boil water and salt in a pot with a lid.
            Mix maize meal with cold water.
            Stir into the boiling water.
            Simmer for at least 30 minutes with the lid on.
            Add a dollop of butter.
            Serve with milk and sugar or honey.
            """, ingredients: ["Honey","Cream"],percent: [50,50],author: "David Micheal"))
        tableData.append(Meal(name: "Meal9", photo: UIImage(named:"Image-9")!, description: """
            Boil water and salt in a pot with a lid.
            Mix maize meal with cold water.
            Stir into the boiling water.
            Simmer for at least 30 minutes with the lid on.
            Add a dollop of butter.
            Serve with milk and sugar or honey.
            """, ingredients: ["Salt","Water"],percent: [50,50],author: "David Micheal"))
        tableData.append(Meal(name: "Meal10", photo: UIImage(named:"Image-10")!, description: """
            Boil water and salt in a pot with a lid.
            Mix maize meal with cold water.
            Stir into the boiling water.
            Simmer for at least 30 minutes with the lid on.
            Add a dollop of butter.
            Serve with milk and sugar or honey.
            """, ingredients: ["Sugar","Salt"],percent: [50,50],author: "David Micheal"))
        
        self.tableDataSource = MenuData(listMeal: ["Main": [tableData[0],tableData[1],tableData[2]], "Dessert":[tableData[3],tableData[4],tableData[5],tableData[6],tableData[7],tableData[8],tableData[9]]])
    }
}
