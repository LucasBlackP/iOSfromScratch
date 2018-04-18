//
//  DetailCell.swift
//  CustomCell
//
//  Created by cpu12130-local on 4/11/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell ,ConfigurableCell{
    
    typealias DataType = Meal
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.name.font = UIFont.boldSystemFont(ofSize: 18)
        self.photo.layer.masksToBounds = true
        self.photo.layer.cornerRadius = photo.frame.height/2.0
        print("\(photo.frame.height)")
        self.photo.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(data: Meal) {
        self.name.text = data.name
        self.photo.image = data.photo
    }
    func pushView(data: Meal) -> UIViewController? {
        let vc = EditPhotoController()
        vc.image = data.photo
        vc.title = data.name
        return vc
    }
    
    
}
