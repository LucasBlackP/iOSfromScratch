//
//  ProfileViewController.swift
//  CustomCell
//
//  Created by cpu12130-local on 6/14/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var txtUsername: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewDidLayoutSubviews() {
        avatar.clipsToBounds = true
        avatar.layer.masksToBounds = true
        avatar.layer.cornerRadius = avatar.frame.height/2.0
    }

}
