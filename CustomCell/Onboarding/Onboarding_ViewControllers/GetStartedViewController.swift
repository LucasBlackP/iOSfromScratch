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
//        self.navigationController?.navigationBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    //Transition to OnBoardingViewController
    @IBAction func getStarted(_ sender: UIButton) {
        let onBoardingViewController = OnBoardingRouter.configureVIPER()
//        self.navigationController?.viewControllers.append(onBoardingViewController)
        TranslateAnimation.addTranslateAnimation(addTo: self, .right, 0.3)
        present(onBoardingViewController, animated: false, completion: nil)
    }
    
    
    @IBAction func goToNextScreen(_ sender: UISwipeGestureRecognizer) {
        let onBoardingViewController = OnBoardingRouter.configureVIPER()
        if sender.direction == .left{
            switch sender.state{
            case .ended:
                TranslateAnimation.addTranslateAnimation(addTo: self, .right, 0.3)
                present(onBoardingViewController, animated: false, completion: nil)
            default:
                break;
            }
        }
    }
    
}

