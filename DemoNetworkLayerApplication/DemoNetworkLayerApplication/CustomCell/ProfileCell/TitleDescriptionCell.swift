//
//  TitleDescriptionCell.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 5/8/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class TitleDescriptionCell: UITableViewCell, ConfigurableCell {
    
    typealias DataType = [String:String]
    //MARK: Properties
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(data: [String : String]) {
        self.labelTitle.text = data.keys.first!
        self.labelDescription.text = data.values.first!
    }
    func pushView(data: [String : String]) -> UIViewController? {
        return nil
    }
    func setHeight() -> Int {
        return 40
    }
}
