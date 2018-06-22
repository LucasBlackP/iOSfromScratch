//
//  AddNofViewController.swift
//  CustomCell
//
//  Created by Thang Tran on 6/21/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class AddNofViewController: UIViewController {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let notificationCenter = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationCenter.addObserver(self, selector: #selector(playbackDidStart), name: .playbackStarted, object: nil)
    }
    
    @objc private func playbackDidStart(_ notification: Notification) {
        guard let item = notification.object as? AudioPlayerWithNof.Item else {
            let object = notification.object as Any
            assertionFailure("Invalid object: \(object)")
            return
        }
        
        //example
        titleLabel.text = item.title
        
    }
}


