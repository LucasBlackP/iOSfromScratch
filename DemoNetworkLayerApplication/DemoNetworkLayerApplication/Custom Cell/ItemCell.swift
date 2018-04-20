//
//  ItemCell.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 4/20/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell, ConfigurableCell {
    //MARK: Properties
    typealias DataType = ListViewModel
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var tittle: UILabel!
    @IBOutlet weak var id: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(data: ListViewModel) {
        self.tittle.text = data.title
        self.id.text = "\(data.id)"
        let url:NSURL = NSURL(string: data.thumbUrl)!
        let dataImage = NSData(contentsOf: url as URL)
        photo?.image = UIImage(data: dataImage! as Data)
        //imageView?.image = UIImage(named: "image")
    }
    func pushView(data: ListViewModel) -> UIViewController? {
        //TODO: later
        return nil
    }
}
