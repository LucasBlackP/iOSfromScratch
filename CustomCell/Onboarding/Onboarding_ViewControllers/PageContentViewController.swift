//
//  PageContentViewController.swift
//  CustomCell
//
//  Created by cpu12130-local on 5/22/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

protocol PageContentViewProtocol: class{
    var index: Int?{get set}
    func config(index: Int, contentData: PageContentModel)
}

class PageContentViewController: UIViewController, PageContentViewProtocol {

    //MARK: Properties
    var index: Int?
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.awakeFromNib()
        self.loadView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func config(index: Int, contentData: PageContentModel) {
        self.index = index
        self.imgLogo.image = contentData.image
        self.imgLogo.clipsToBounds = true
        self.imgLogo.layer.masksToBounds = true
        self.imgLogo.layer.cornerRadius = self.imgLogo.bounds.width / 4.0
        self.lbTitle.text = contentData.title
        self.lbTitle.font = UIFont.boldSystemFont(ofSize: 20)
        self.lbDescription.text = contentData.description
    }
}

