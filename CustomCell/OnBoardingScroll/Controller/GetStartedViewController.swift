//
//  OnBoardingViewController.swift
//  CustomCell
//
//  Created by cpu12130-local on 5/22/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController, ScrollPageContentProtocol, ScrollPageViewControllerProtocol {

    //MARK: Properties

    @IBOutlet weak var btnGetStarted: UIButton!{
        didSet{
            btnGetStarted.layer.masksToBounds = true
            btnGetStarted.clipsToBounds = true
            btnGetStarted.layer.cornerRadius = btnGetStarted.bounds.height/2.0
        }
    }
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Get Started"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    //Transition to OnBoardingViewController

    func config(contentModel: PageContentModel?) {
    }
    func nextPage()->Bool {
        return false
    }
}

