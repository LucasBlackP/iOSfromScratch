//
//  OnBoardingScrollViewController.swift
//  CustomCell
//
//  Created by cpu12130-local on 5/25/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

protocol OnBoardingScrollViewProtocol: class{
    var presenter: OnBoardingScrollPresenterProtocol?{get set}
    var pages: [ScrollPageContentProtocol]?{get set}
}

class OnBoardingScrollViewController: UIViewController, OnBoardingScrollViewProtocol, ScrollPageViewControllerProtocol {

    //MARK: Properties
    @IBOutlet weak var pageControl: UIPageControl!{
        didSet{
            pageControl.currentPageIndicatorTintColor = UIColor(red: 0, green: 0.5, blue: 0.9, alpha: 1)
            pageControl.pageIndicatorTintColor = .gray
            pageControl.currentPage = 0
        }
    }
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.bounds = UIScreen.main.bounds
            scrollView.isPagingEnabled = true
            scrollView.showsHorizontalScrollIndicator = false
        }
    }
    var pages: [ScrollPageContentProtocol]?
    var presenter: OnBoardingScrollPresenterProtocol?
    
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadPageContent()
        configureView()
    }
    
    //Prepare page content
    func loadPageContent(){
        self.pages = presenter?.loadOnBoardingPages()
    }
    //Configure view
    func configureView(){
        view.frame = UIScreen.main.bounds
        view.bringSubview(toFront: pageControl)
        scrollView.delegate = self
        settingScrollView(pages: pages!)
    }
    //Configure scroll view
    func settingScrollView(pages: [ScrollPageContentProtocol]){
        scrollView.contentSize = CGSize(width:  view.frame.width * CGFloat(pages.count), height: 0)
        pageControl.numberOfPages = pages.count
        for i in 0 ..< pages.count {
            if let page = pages[i] as? UIViewController{
                page.view.frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: scrollView.frame.height)
                scrollView.addSubview(page.view)
            }
        }
    }
    
    func nextPage()->Bool {
        if(scrollView.contentOffset.x + view.frame.width < scrollView.contentSize.width){
            scrollView.setContentOffset(CGPoint(x: scrollView.contentOffset.x + view.frame.width, y: 0), animated: true)
            return true
        }
        return false
    }
    @IBAction func skipPage(_ sender: UIButton) {
        scrollView.setContentOffset(CGPoint(x: view.frame.width * CGFloat((pages?.count)! - 1), y: 0), animated: true)
    }
    
}

extension OnBoardingScrollViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(currentPageIndex)
    }
    override func viewDidLayoutSubviews() {
        
    }
}








