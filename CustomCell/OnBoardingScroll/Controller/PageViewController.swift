//
//  PageViewController.swift
//  CustomCell
//
//  Created by cpu12130-local on 5/25/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class PageViewController: UIViewController, ScrollPageContentProtocol {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var txtDescription: UITextView!{
        didSet{
            txtDescription.isEditable = false
        }
    }
    //MARK: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        //Configure image
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.layer.cornerRadius = image.frame.height/2.0
    }
    //MARK: Configuration
    //Config page content
    func config(contentModel: PageContentModel?){
        awakeFromNib()
        loadViewIfNeeded()
        self.image.image = contentModel?.image
        self.lbTitle.text = contentModel?.title
        self.txtDescription.text = contentModel?.description
    }
    

}
