//
//  TranslateAnimation.swift
//  CustomCell
//
//  Created by cpu12130-local on 5/23/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

enum TransitionDirection{
    case left
    case right
}

class TranslateAnimation{
    static func addTranslateAnimation(addTo viewController: UIViewController, _ direction: TransitionDirection, _ duration: Double){
        let transition = CATransition()
        transition.duration = duration
        transition.type = kCATransitionPush
        switch  direction {
        case .left:
            transition.subtype = kCATransitionFromLeft
        case .right:
            transition.subtype = kCATransitionFromRight
        }
        viewController.view.layer.add(transition, forKey: kCATransition)
    }
}
