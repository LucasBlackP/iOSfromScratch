//
//  HUB.swift
//  CustomCell
//
//  Created by cpu12130-local on 6/21/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import Foundation
import MBProgressHUD
class HUB : UIView, IndicatorProtocol {
    static func createProgressHUB(to view: UIView, animated: Bool, label: String?){
        let hud = MBProgressHUD.showAdded(to: view, animated: animated)
        hud.label.text = label
        hud.show(animated: true)
    }
    static func removeProgressHUB(for view: UIView, animated: Bool){
        MBProgressHUD.hide(for: view, animated: animated)
    }
}

protocol IndicatorProtocol {
    func showIndicator()
    func removeIndicator()
}
extension IndicatorProtocol where Self: UIView {
    var indicatorTag: Int {
        return 1997
    }
    func showIndicator() {
        let indicator = UIActivityIndicatorView(frame: self.frame)
        let buttonHeight = self.bounds.size.height
        let buttonWidth = self.bounds.size.width
        indicator.center = CGPoint(x: buttonWidth/2, y: buttonHeight/2)
        indicator.clipsToBounds = true
        indicator.layer.masksToBounds = true
        indicator.layer.cornerRadius = self.layer.cornerRadius
        indicator.activityIndicatorViewStyle = .whiteLarge
        indicator.color = .white
        indicator.backgroundColor = UIColor(red: 230/255, green: 238/255, blue: 1, alpha: 0.8)
        indicator.hidesWhenStopped = true
        indicator.tag = indicatorTag
        self.addSubview(indicator)
        indicator.startAnimating()
    }
    func removeIndicator(){
        let indicator = self.viewWithTag(indicatorTag) as? UIActivityIndicatorView
        indicator?.stopAnimating()
        indicator?.removeFromSuperview()
    }
}







