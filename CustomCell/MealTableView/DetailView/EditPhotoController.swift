//
//  EditPhotoController.swift
//  CustomCell
//
//  Created by cpu12130-local on 4/13/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class EditPhotoController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var btnChangePhoto: UIButton!
    @IBOutlet weak var photo: UIImageView!{
        didSet{
            photo.clipsToBounds = true
            photo.layer.masksToBounds = true
            photo.layer.cornerRadius = photo.bounds.height/2.0
        }
    }
    var image:UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        photo.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
