//
//  CustomTableCell.swift
//  CustomCell
//
//  Created by cpu12130-local on 4/11/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class MealCell: UITableViewCell,ConfigurableCell {
    
    typealias DataType = Meal
    
    @IBOutlet weak var mealPhoto: UIImageView!{
        didSet{
            mealPhoto.layer.masksToBounds = true
            mealPhoto.layer.cornerRadius = mealPhoto.frame.height/2
            mealPhoto.clipsToBounds = true
        }
    }
    @IBOutlet weak var mealName: UILabel!{
        didSet{
             mealName.font = UIFont.boldSystemFont(ofSize: 13)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func pushView(data: Meal) -> UIViewController? {
        let vc = DetailTableViewController()
        vc.meal = data
        return vc
    }
    
    func configure(data: Meal) {
        self.mealName.text = data.name
        self.mealPhoto.image = data.photo
    }
    
}
