//
//  FlagItemController.swift
//  CustomCell
//
//  Created by cpu12130-local on 5/30/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class FlagItemController: UIViewController {

    //MARK: Properties
    @IBOutlet var btnFlag: UIButton!
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.frame = btnFlag.frame
    }

    //MARK: Acrtions
    @IBAction func markFlag(_ sender: UIButton) {
    }
    
    

   

}
