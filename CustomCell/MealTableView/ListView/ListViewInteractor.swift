//
//  ListViewInteractor.swift
//  CustomCell
//
//  Created by cpu12130-local on 4/17/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

protocol ListViewInteractorProtocol: class{
    func initData()->MenuData?
    func deleteData(index: Int)
}

class ListViewInteractor{
    
    //MARK: Properties
    weak var tableViewControllerDelegate: MealTableViewControllerProtocol?
    var tableData = [Meal]()
}
extension ListViewInteractor: ListViewInteractorProtocol{
    func initData()->MenuData?{
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
        
        return MenuData(listMeal: ["Main": [tableData[0],tableData[1],tableData[2],tableData[3],tableData[4],tableData[5],tableData[6],tableData[7],tableData[8],tableData[9]]])
    }
    func deleteData(index: Int) {
        tableData.remove(at: index)
        var listMeal = [Meal]()
        for meal in tableData {
            listMeal.append(meal)
        }
        tableViewControllerDelegate?.updateData(data: MenuData(listMeal: ["Main": listMeal]))
        
    }
}
