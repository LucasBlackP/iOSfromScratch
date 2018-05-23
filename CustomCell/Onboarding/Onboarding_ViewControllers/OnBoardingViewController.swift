//
//  OnBoardingViewController.swift
//  CustomCell
//
//  Created by cpu12130-local on 5/22/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

protocol OnBoardingViewControllerProtocol: class{
    var presenter: OnBoardingPresenterProtocol?{get set}
}

class OnBoardingViewController: UIViewController,OnBoardingViewControllerProtocol {

    //MARK: Properties
    var presenter: OnBoardingPresenterProtocol?
    @IBOutlet weak var btnSkip: UIButton!{
        didSet{
            self.btnSkip.layer.masksToBounds = true
            self.btnSkip.clipsToBounds = true
            self.btnSkip.layer.cornerRadius = btnSkip.bounds.height/2.0
        }
    }
    @IBOutlet weak var btnNext: UIButton!{
        didSet{
            self.btnNext.layer.masksToBounds = true
            self.btnNext.clipsToBounds = true
            self.btnNext.layer.cornerRadius = btnNext.bounds.height/2.0
        }
    }
    var pageViewController: UIPageViewController!
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = ""
        self.navigationController?.navigationBar.isHidden = false
        self.presenter?.loadData()
         configurePageViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Handle event click on skip button
    @IBAction func onSkip(_ sender: UIButton) {
        let lastPage = self.presenter?.lastPage() as! UIViewController
        self.pageViewController.setViewControllers([lastPage], direction: .forward, animated: true, completion: nil)
    }
    //Handle event click on next button
    @IBAction func onNext(_ sender: UIButton) {
        let nextPage = presenter?.nextPageContent(index: (self.pageViewController.viewControllers?.first as! PageContentViewController).index!) as? UIViewController
        guard let page = nextPage else{
            self.presenter?.displayMainScreen()
            return
        }
        self.pageViewController.setViewControllers([page], direction: .forward, animated: true, completion: nil)
    }
    
    @IBAction func backToPreviousScreen(_ sender: UIScreenEdgePanGestureRecognizer) {
        if sender.edges == .left{
            if(sender.state == .ended && (self.pageViewController.viewControllers?.first as! PageContentViewProtocol).index! == 0){
                TranslateAnimation.addTranslateAnimation(addTo: self, .left, 0.3)
                dismiss(animated: false, completion: nil)
            }
        }
    }
}

extension OnBoardingViewController: UIPageViewControllerDataSource{
    //Load next page for displaying
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let page = viewController as? PageContentViewProtocol else {
            return nil
        }
        return self.presenter?.nextPageContent(index: page.index!) as? UIViewController
    }
    //Load previous page for displaying
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let page = viewController as? PageContentViewProtocol else {
            return nil
        }
        return self.presenter?.previousPageContent(index: page.index!) as? UIViewController
    }
    //Present number of the dots
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        configurePageControl()
        return (self.presenter?.numberOfPage())!
    }
    //Display selected dot for current page
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return (pageViewController.viewControllers?.first as! PageContentViewProtocol).index!
    }
}

extension OnBoardingViewController{
    //Set color for dots in Page Control
    func configurePageControl(){
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = UIColor(red: 0.0, green: 0.5, blue: 1, alpha: 1)
    }
    //Configure page view controller
    func configurePageViewController(){
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageViewController.dataSource = self
        self.pageViewController.setViewControllers([self.presenter?.firstPage() as! UIViewController], direction: .forward, animated: true, completion: nil)
        self.pageViewController.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - 80)
        self.addChildViewController(self.pageViewController)
        self.view.addSubview((self.pageViewController.view)!)
        self.pageViewController.didMove(toParentViewController: self)
    }
}

















