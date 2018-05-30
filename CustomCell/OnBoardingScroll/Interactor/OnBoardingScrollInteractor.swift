//
//  OnBoardingScrollInteractor.swift
//  CustomCell
//
//  Created by cpu12130-local on 5/25/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

protocol OnBoardingScrollInteractorProtocol: class{
    var presenter: OnBoardingScrollPresenterProtocol?{get set}
    func loadScrollPage()->[ScrollPageContentProtocol]
}
class OnBoardingScrollInteractor: OnBoardingScrollInteractorProtocol{
    weak var presenter: OnBoardingScrollPresenterProtocol?
    func loadScrollPage() -> [ScrollPageContentProtocol] {
        let data = [PageContentModel(image: UIImage(named: "Image-1")!, title: "Take it easy!", description: "Easy to view, edit and delete meals"),PageContentModel(image: UIImage(named: "Image-2")!, title: "Special", description: "You'll receive some special gifts from us"),PageContentModel(image: UIImage(named: "Image-3")!, title: "Having fun!", description: "Many big game was held in the last 2 months"),PageContentModel(image: UIImage(named: "Image-4")!, title: "Let's join with us", description: "Your friends are waiting for you...")]
//        let page0 = GetStartedViewController()
        let page1 = PageViewController()
        page1.config(contentModel: data[0])
        let page2 = PageViewController()
        page2.config(contentModel: data[1])
        let page3 = PageViewController()
        page3.config(contentModel: data[2])
        let page4 = PageViewController()
        page4.config(contentModel: data[3])
        return [page1,page2,page3,page4]
    }
}
