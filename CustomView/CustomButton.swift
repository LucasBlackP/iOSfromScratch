//
//  CustomButton.swift
//  CustomCell
//
//  Created by cpu12130-local on 6/25/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class BaseButton: UIButton, IndicatorProtocol {
}

final class RadiusButton: BaseButton{
    static let defaultColor = UIColor(red: 0, green: 150/255, blue: 255/255, alpha: 1)
    static let disableColor = UIColor(red: 213/255, green: 213/255, blue: 213/255, alpha: 0.8)
        
    override func didMoveToSuperview() {
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.height/2
    }
}
