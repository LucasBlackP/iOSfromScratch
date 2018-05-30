//
//  OnBoardingMasterScrollViewController.swift
//  CustomCell
//
//  Created by cpu12130-local on 5/29/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit


protocol MasterScrollViewProtocol: class{
    var presenter: MasterScrollPresenterProtocol?{get set}
    var pages: [UIViewController]?{get set}
}

class MasterScrollViewController: UIViewController, MasterScrollViewProtocol {
    //MARK: Properties
    var presenter: MasterScrollPresenterProtocol?
    var pages: [UIViewController]?
    @IBOutlet weak var btnNext: UIButton!{
        didSet{
            btnNext.clipsToBounds = true
            btnNext.layer.masksToBounds = true
            btnNext.layer.cornerRadius = btnNext.frame.height/2.0
        }
    }
    @IBOutlet weak var masterScrollView: UIScrollView!{
        didSet{
            masterScrollView.bounds = UIScreen.main.bounds
            masterScrollView.isPagingEnabled = true
            masterScrollView.showsHorizontalScrollIndicator = false
        }
    }
    @IBOutlet weak var btnVirtual: UIButton!{
        didSet{
            btnVirtual.isEnabled = false
            btnVirtual.isHidden = true
        }
    }
    var deltaDistance = 0.0
    var oldDistanceValue = 0.0
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
        loadPageContent()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func configureView(){
        self.title = "Master"
        view.frame = UIScreen.main.bounds
        view.bringSubview(toFront: btnNext)
        masterScrollView.delegate = self
    }
    func loadPageContent(){
        pages = presenter?.loadOnBoardingPages()
        guard let pageContents = pages else{
            return
        }
        masterScrollView.contentSize = CGSize(width: view.bounds.width * CGFloat(pageContents.count), height: 0)
        for i in 0 ..< pageContents.count {
           let page = pageContents[i]
            page.view.frame = CGRect(x: CGFloat(i) * view.frame.width, y: 0, width: view.frame.width, height: view.frame.height)
            masterScrollView.addSubview((page.view)!)
        }
    }
    
    @IBAction func nextPage(_ sender: UIButton) {
        guard let pageContents = pages as? [ScrollPageViewControllerProtocol] else{
            return
        }
        let currentPage = pageContents[Int(round(masterScrollView.contentOffset.x/view.frame.width))]
        if !currentPage.nextPage() {
            if(masterScrollView.contentOffset.x + view.frame.width<masterScrollView.contentSize.width){
                masterScrollView.setContentOffset(CGPoint(x: masterScrollView.contentOffset.x + view.frame.width, y: 0), animated: true)
            }
        }
    }
}

extension MasterScrollViewController: UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let pageContents = pages as? [ScrollPageViewControllerProtocol] else{
            return
        }
        if(scrollView.contentOffset.x>0 && scrollView.contentOffset.x<view.frame.width*CGFloat(pageContents.count-1)){
//        print("show offset \(scrollView.contentOffset.x)")
        let distanceX = (btnVirtual.center.x - btnNext.center.x)
        let distanceY = (btnVirtual.center.y - btnNext.center.y)
        let angle = atan(distanceY/distanceX)
        
        if (Double(scrollView.contentOffset.x) > oldDistanceValue){
            let translate = (Double(scrollView.contentOffset.x) - oldDistanceValue)*Double(cos(angle))/1.8
            let translateX = translate*Double(cos(angle))*Double(view.frame.width/414)
            let translateY = translate*Double(sin(angle))*Double(view.frame.height/736)
//             print("show offset \(translateX)  \(translateY)")
            UIView.animate(withDuration: 0.5){
                self.btnNext.center = CGPoint(x: self.btnNext.center.x + CGFloat(translateX), y: self.btnNext.center.y + CGFloat(translateY))
            }
        }
        else{
            let translate = abs(Double(scrollView.contentOffset.x) - oldDistanceValue)*Double(cos(angle))/1.8
            let translateX = translate*Double(cos(angle))*Double(view.frame.width/414)
            let translateY = translate*Double(sin(angle))*Double(view.frame.height/736)
//            print("show offset \(translateX)  \(translateY)")
            UIView.animate(withDuration: 0.5){
                self.btnNext.center = CGPoint(x: self.btnNext.center.x - CGFloat(translateX), y: self.btnNext.center.y - CGFloat(translateY))
            }
        }
        oldDistanceValue = Double(scrollView.contentOffset.x)
        
        }
    }
    
}






