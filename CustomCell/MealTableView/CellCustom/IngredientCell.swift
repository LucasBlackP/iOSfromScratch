//
//  IngredientCell.swift
//  CustomCell
//
//  Created by cpu12130-local on 4/11/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class IngredientCell: UITableViewCell,ConfigurableCell {
    weak var delegate: ScrollableCellDelegate?
    var indexPath: IndexPath?
    typealias DataType = [String:Int]
    @IBOutlet weak var ingredient: UILabel!
    @IBOutlet weak var percent: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(data: [String:Int]) {
        for (key,value) in data{
            self.ingredient.text = key
            self.percent.text = "\(value)%"
        }
    }
    func pushView(data: [String : Int]) -> UIViewController? {
        return nil
    }
    func setDelegate(delegate: ScrollableCellDelegate?, indexPath: IndexPath) {
        self.delegate = delegate
        self.indexPath = indexPath
    }
}
