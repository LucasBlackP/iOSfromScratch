//
//  DetailModel.swift
//  CustomCell
//
//  Created by cpu12130-local on 4/17/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import Foundation
class MenuData{
    var listMeal = [[String:[CellConfigurator]]]()
    init(listMeal:[String:[Meal]]){
        for (key,value) in listMeal {
            var meals = [TableCellConfigurator<MealCell, Meal>]()
            for meal in value{
                meals.append(TableCellConfigurator<MealCell, Meal>.init(item: meal))
            }
            self.listMeal.append([key : meals])
        }
    }
}
