//
//  ErrorOptions.swift
//  CustomCell
//
//  Created by Thang Tran on 6/25/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import Foundation
import UIKit

struct Color {
    let red: Double
    let green: Double
    let blue: Double
    
    init(red: Double = 0.0, green: Double = 0.0, blue: Double = 0.0) {
        self.red = red
        self.green = green
        self.blue = blue
    }
}



struct ErrorOptions {
    let message: String
    let showArrow: Bool
    let backgroundColor: Color
    let size: CGSize
    let canDismissByTap: Bool
    
    init(message: String = "Error!", shouldShowArrow: Bool = true, backgroundColor: Color = Color(), size: CGSize = .zero, canDismissByTappingAnywhere canDismiss: Bool = true) {
        self.message = message
        self.showArrow = shouldShowArrow
        self.backgroundColor = backgroundColor
        self.size = size
        self.canDismissByTap = canDismiss
    }
    
}


