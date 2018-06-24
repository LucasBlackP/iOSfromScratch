//
//  DetailCell.swift
//  CustomCell
//
//  Created by cpu12130-local on 4/11/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell ,ConfigurableCell{
    weak var delegate: ScrollableCellDelegate?
    var indexPath: IndexPath?
    typealias DataType = Meal
    @IBOutlet weak var photo: UIImageView!{
        didSet{
            photo.layer.masksToBounds = true
            photo.layer.cornerRadius = photo.frame.height/2.0
            photo.clipsToBounds = true
        }
    }
    @IBOutlet weak var name: UILabel!{
        didSet{
            name.font = UIFont.boldSystemFont(ofSize: 18)
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
    func configure(data: Meal) {
        name.text = data.name
        photo.image = data.photo
    }
    func pushView(data: Meal) -> UIViewController? {
        let vc = EditPhotoController()
        vc.image = data.photo
        vc.title = data.name
        return vc
    }
    func setDelegate(delegate: ScrollableCellDelegate?, indexPath: IndexPath) {
        self.delegate = delegate
        self.indexPath = indexPath
    }
    
    
}
