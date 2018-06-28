//
//  ErrorPopoverRenderer.swift
//  CustomCell
//
//  Created by Thang Tran on 6/25/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

protocol ErrorPopoverRenderer {
    func presentError(errorOptions: ErrorOptions) 
}

extension ErrorPopoverRenderer where Self: UIViewController {
    func presentError(errorOptions:ErrorOptions = ErrorOptions()) {
        // implement here
    }
}


