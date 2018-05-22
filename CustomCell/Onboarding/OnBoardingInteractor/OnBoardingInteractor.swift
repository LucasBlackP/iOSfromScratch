//
//  OnBoardingInteractor.swift
//  CustomCell
//
//  Created by cpu12130-local on 5/22/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

protocol OnBoardingInteractorProtocol: class{
    var data: [PageContentModel]?{get set}
    var pagesContent: [PageContentViewProtocol]{get set}
    var presenter: OnBoardingPresenterProtocol? {get set}
    func loadNextPageContent(index: Int) -> PageContentViewProtocol?
    func loadPreviousPageContent(index: Int) -> PageContentViewProtocol?
    func loadData()
    func numberOfPage()->Int
    func firstPage()->PageContentViewProtocol?
}

class OnBoardingInteractor: OnBoardingInteractorProtocol{
    //MARK: Properties
    var data: [PageContentModel]?
    weak var presenter: OnBoardingPresenterProtocol?
    var pagesContent = [PageContentViewProtocol]()
    //MARK: Methods
    func loadData() {
        pagesContent = [PageContentViewProtocol]()
        self.data = [PageContentModel(image: UIImage(named: "Image-1")!, title: "Take it easy!", description: "Easy to view, edit and delete meals"),PageContentModel(image: UIImage(named: "Image-2")!, title: "Special", description: "You'll receive some special gifts from us"),PageContentModel(image: UIImage(named: "Image-3")!, title: "Having fun!", description: "Many big game was held in the last 2 months"),PageContentModel(image: UIImage(named: "Image-4")!, title: "Let's join with us", description: "Your friends are waiting for you...")]
        var index = 0
        for content in self.data! {
            let newPage = PageContentViewController.init(nibName: "PageContentViewController", bundle: nil)
            newPage.viewDidLoad()
            newPage.config(index: index, contentData: content)
            index += 1
            self.pagesContent.append(newPage)
        }
    }
    func loadNextPageContent(index: Int) -> PageContentViewProtocol? {
        let numberOfPage = self.pagesContent.count
        if (index < 0 || index > numberOfPage ){
            return nil
        }
        return self.pagesContent[(index + 1) % numberOfPage]
    }
    func loadPreviousPageContent(index: Int) -> PageContentViewProtocol? {
        let numberOfPage = self.pagesContent.count
        print("\(index)")
        print(pagesContent)
        if (index < 0 || index >= numberOfPage ){
            return nil
        }
        if index == 0{
            return self.pagesContent[numberOfPage-1]
        }
        return self.pagesContent[(index - 1)]
    }
    func numberOfPage() -> Int {
        return self.pagesContent.count
    }
    func firstPage() -> PageContentViewProtocol? {
        return self.pagesContent[0]
    }
}
