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
    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    var pageViewController: UIPageViewController!
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setButtonCornerRadius()
        self.presenter?.loadData()
         configurePageViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Handle event click on skip button
    @IBAction func onSkip(_ sender: UIButton) {
        let navController = UINavigationController(rootViewController: MealTableViewController())
        present(navController, animated: true, completion: nil)
    }
    //Handle event click on next button
    @IBAction func onNext(_ sender: UIButton) {
       
    }
    
}
extension OnBoardingViewController{
    //Configure corner radius for Skip button and next button
    func setButtonCornerRadius(){
        self.btnNext.layer.masksToBounds = true
        self.btnNext.clipsToBounds = true
        self.btnNext.layer.cornerRadius = btnNext.bounds.height/5.0
        self.btnSkip.layer.masksToBounds = true
        self.btnSkip.clipsToBounds = true
        self.btnSkip.layer.cornerRadius = btnSkip.bounds.height/2.0
    }
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
        self.pageViewController.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - 50)
        self.addChildViewController(self.pageViewController)
        self.view.addSubview((self.pageViewController.view)!)
        self.pageViewController.didMove(toParentViewController: self)
    }
}

extension OnBoardingViewController: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let page = viewController as? PageContentViewProtocol else {
            return nil
        }
        return self.presenter?.nextPageContent(index: page.index!) as? UIViewController
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let page = viewController as? PageContentViewProtocol else {
            return nil
        }
        return self.presenter?.previousPageContent(index: page.index!) as? UIViewController
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        configurePageControl()
        return (self.presenter?.numberOfPage())!
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}

















