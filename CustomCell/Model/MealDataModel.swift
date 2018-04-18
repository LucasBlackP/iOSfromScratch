//
//  MealData.swift
//  CustomCell
//
//  Created by cpu12130-local on 4/11/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit
class MealData{
    var numOfSection:Int
    var titles:[String]
    var numberOfRows:[Int]
    var meal:Meal
    var secHeight:[Int]
    init(numSec num:Int,titles tit:[String],rowCount rows:[Int],meal mealItem:Meal,secHeight: [Int]){
        self.numOfSection = num
        self.titles = tit
        self.numberOfRows = rows
        self.meal = mealItem
        self.secHeight = secHeight
    }
}

struct MainModel {
    struct Request {
        
    }
    
    struct  Response {
        
    }
    
    struct Viewmodel {
        
    }
}


let response = MainModel.Response()

let request = MainModel.Request()
