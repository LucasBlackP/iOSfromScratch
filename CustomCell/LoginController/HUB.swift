//
//  HUB.swift
//  CustomCell
//
//  Created by cpu12130-local on 6/21/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import Foundation
import MBProgressHUD
class HUB{
    static func createProgressHUB(to view: UIView, animated: Bool, label: String?){
        let hud = MBProgressHUD.showAdded(to: view, animated: animated)
        hud.label.text = label
        hud.show(animated: true)
    }
    static func removeProgressHUB(for view: UIView, animated: Bool){
        MBProgressHUD.hide(for: view, animated: animated)
    }
    static func createIndicator(for view: UIView)->UIActivityIndicatorView{
        let indicator = UIActivityIndicatorView(frame: view.frame)
        indicator.clipsToBounds = true
        indicator.layer.masksToBounds = true
        indicator.layer.cornerRadius = view.layer.cornerRadius
        indicator.activityIndicatorViewStyle = .whiteLarge
        indicator.color = .red
        indicator.backgroundColor = UIColor(red: 230/255, green: 238/255, blue: 1, alpha: 0.8)
        indicator.hidesWhenStopped = true
        return indicator
    }
}
