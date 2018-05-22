//
//  OnBoardingViewController.swift
//  CustomCell
//
//  Created by cpu12130-local on 5/22/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {

    //MARK: Properties

    @IBOutlet weak var btnGetStarted: UIButton!
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setButtonCornerRadius()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    //Transition to OnBoardingViewController
    @IBAction func getStarted(_ sender: UIButton) {
        let onBoardingViewController = OnBoardingRouter.configureVIPER()
        present(onBoardingViewController, animated: true, completion: nil)
    }
}

extension GetStartedViewController{
    //Configure corner radius for button
    func setButtonCornerRadius(){
        btnGetStarted.layer.masksToBounds = true
        btnGetStarted.clipsToBounds = true
        btnGetStarted.layer.cornerRadius = btnGetStarted.bounds.height/5.0
    }
    
}
