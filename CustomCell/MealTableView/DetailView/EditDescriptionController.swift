//
//  EditDescriptionController.swift
//  CustomCell
//
//  Created by cpu12130-local on 4/13/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class EditDescriptionController: UIViewController {

    @IBOutlet weak var desc: UITextView!
    var recvDesc = ""
    weak var descDelegate: DescriptionDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        desc.text = recvDesc
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func saveDesc(_ sender: UIButton) {
        self.descDelegate?.updateDesc(data: desc.text!)
    }
}
