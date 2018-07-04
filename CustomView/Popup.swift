//
//  Popup.swift
//  CustomCell
//
//  Created by cpu12130-local on 6/25/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

struct PopupConfiguration{
    let title: String
    let message: String
    
    init(title: String = "Title Default", message: String = "message default" ) {
        self.title = title
        self.message = message
    }
}

protocol PopupProtocol{
}

extension PopupProtocol where Self: UIViewController{
    func showPopup(config: PopupConfiguration = PopupConfiguration(), handler: @escaping ()->() = {}){
        let alert = UIAlertController(title: config.title, message: config.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            _ in
            handler()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
