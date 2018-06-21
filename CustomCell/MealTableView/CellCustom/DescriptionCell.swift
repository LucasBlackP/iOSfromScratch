//
//  DescriptionCell.swift
//  CustomCell
//
//  Created by cpu12130-local on 4/11/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class DescriptionCell: UITableViewCell,ConfigurableCell{
    weak var delegate: ScrollableCellDelegate?
    var indexPath: IndexPath?
    @IBOutlet weak var mealDesc: UILabel!
     typealias DataType = String
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(data: String) {
        self.mealDesc.text = data
    }
    func pushView(data: String) -> UIViewController? {
        let vc = EditDescriptionController()
        vc.recvDesc = data
        vc.title = "Description"
        return vc
    }
    func setDelegate(delegate: ScrollableCellDelegate?, indexPath: IndexPath) {
        self.delegate = delegate
        self.indexPath = indexPath
    }

}
