//
//  UserAvatarCell.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 5/8/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class UserAvatarCell: UITableViewCell, ConfigurableCell {

    typealias DataType = UserModel

    //MARK: Properties
    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelNickname: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(data: UserModel) {
        self.imageAvatar.image = data.avatar
        self.imageAvatar.clipsToBounds = true
        self.imageAvatar.layer.masksToBounds = true
        self.imageAvatar.layer.cornerRadius = self.imageAvatar.frame.height/2.0
        self.labelName.text = data.username
        self.labelNickname.text = data.nickname
    }
    func pushView(data: UserModel) -> UIViewController? {
         return nil
    }
    func setHeight() -> Int {
        return 150
    }
    
}
