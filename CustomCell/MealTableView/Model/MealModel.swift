//
//  Meal.swift
//  CustomCell
//
//  Created by cpu12130-local on 4/11/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class Meal{
    
    var name: String
    var photo: UIImage
    var description: String
    var ingredients:[String]
    var percentOfIngredients:[Int]
    var author:String
    init(name:String, photo: UIImage, description: String, ingredients: [String],percent perc:[Int],author:String){
        self.name = name
        self.photo = photo
        self.description = description
        self.ingredients = ingredients
        self.percentOfIngredients = perc
        self.author = author
    }
    
}
