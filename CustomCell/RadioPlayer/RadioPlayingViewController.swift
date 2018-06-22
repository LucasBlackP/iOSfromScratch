//
//  RadioPlayingViewController.swift
//  CustomCell
//
//  Created by Thang Tran on 6/21/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class RadioPlayingViewController: UIViewController {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
   var radioPlayer = RadioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        radioPlayer.addObserver(self)
    }
    
}

extension RadioPlayingViewController: RadioPlayerObserver {
    func radioPlayer(_ player: RadioPlayer, didStartPlaying item: RadioPlayer.Item) {
        titleLabel.text = item.title
    }
}
