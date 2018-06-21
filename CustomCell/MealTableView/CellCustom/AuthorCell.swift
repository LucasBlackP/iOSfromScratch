//
//  AuthorCell.swift
//  CustomCell
//
//  Created by cpu12130-local on 4/11/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class AuthorCell: UITableViewCell,ConfigurableCell {
    weak var delegate: ScrollableCellDelegate?
    var indexPath: IndexPath?
    @IBOutlet weak var author: UITextField!
    typealias DataType = String
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.author.borderStyle = UITextBorderStyle.none
        self.author.layer.borderWidth = 0
    }
    
    func configure(data: String) {
        self.author.text = data
    }
    func pushView(data: String) -> UIViewController? {
        return nil
    }
    func setDelegate(delegate: ScrollableCellDelegate?, indexPath: IndexPath) {
        self.delegate = delegate
        self.indexPath = indexPath
    }
}


