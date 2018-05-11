//
//  VideoHistoryCell.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 5/8/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class VideoHistoryCell: UITableViewCell, ConfigurableCell {
    
    
    typealias DataType = WatchedVideoModel
    //Properties
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelLength: UILabel!
    @IBOutlet weak var imageVideo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(data: WatchedVideoModel) {
        self.labelDate.text = data.dateWatched
        self.labelTitle.text = data.videoTitle
        self.labelLength.text = String(data.videoLength)
        self.imageVideo.image = data.videoImage
    }
    
    func pushView(data: WatchedVideoModel) -> UIViewController? {
         return nil
    }
    func setHeight() -> Int {
        return 90
    }
}
