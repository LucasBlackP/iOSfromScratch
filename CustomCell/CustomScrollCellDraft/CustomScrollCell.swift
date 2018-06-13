//
//  CustomScrollCell.swift
//  CustomCell
//
//  Created by cpu12130-local on 5/30/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class CustomScrollCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var scrollArea: UIScrollView!{
        didSet{
            scrollArea.isPagingEnabled = true
            scrollArea.showsHorizontalScrollIndicator = false
        }
    }
    var contents = [UIViewController]()
    var contentWidth = 0.0
    var oldValue  = CGFloat(0)
    //MARK: Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.bounds.size = CGSize(width: UIScreen.main.bounds.width, height: self.bounds.height)
        configureScrollView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureScrollView(){
        scrollArea.delegate = self
        let deleteItem = DeleteItemController()
        let flagItem = FlagItemController()
        contents = [flagItem,deleteItem]
        scrollArea.contentSize = CGSize(width: self.bounds.width + flagItem.view.frame.width + deleteItem.view.frame.width, height: 0)
//        print("\(self.bounds.width), \(flagItem.view.frame.width), \(deleteItem.view.frame.width)")
        contentWidth = Double(flagItem.view.frame.width)
        for i in 0..<contents.count{
            let content = contents[i]
            content.view.frame = CGRect(x: self.frame.maxX + CGFloat(Double(i)*contentWidth), y: self.frame.minY, width: content.view.frame.width, height: content.view.frame.height)
            scrollArea.addSubview(content.view)
        }
    }
    
    //MARK: Actions
    @IBAction func clickOnButton(_ sender: UIButton) {
        print("clicked")
    }
    
}
extension CustomScrollCell: UIScrollViewDelegate{
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("\(scrollView.contentOffset.x), \(contentWidth)")
//
//        let newValue = scrollView.contentOffset.x
//        if(newValue>oldValue){
//            if((newValue-oldValue)>CGFloat(contentWidth)){
//                scrollView.contentOffset.x = CGFloat(contentWidth*2)
//            }
//        }
//        else{
//            if(newValue>CGFloat(contentWidth)){
//                scrollView.contentOffset.x = CGFloat(contentWidth*2)
//            }
//        }
//    }
    
}
