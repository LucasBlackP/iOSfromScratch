//
//  TableData.swift
//  CustomCell
//
//  Created by cpu12130-local on 4/12/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class TableData{
    var data:[[String:[CellConfigurator]]]
    var meal:Meal?
    init(meal: Meal){
        self.meal = meal
        var ingredients = [TableCellConfigurator<IngredientCell, [String:Int]>]()
        for i in 0 ..< self.meal!.ingredients.count {
            ingredients.append(TableCellConfigurator<IngredientCell, [String : Int]>.init(item: [self.meal!.ingredients[i]:self.meal!.percentOfIngredients[i]]))
            //print("\(i)")
        }
        
        data = [
            ["Main Info" : [TableCellConfigurator<DetailCell,Meal>.init(item: self.meal!)]],
            ["Description": [TableCellConfigurator<DescriptionCell,String>.init(item: self.meal!.description)]],
            ["Author": [TableCellConfigurator<AuthorCell,String>.init(item: self.meal!.author)]],
            ["Ingredients":ingredients]]
    }
}
