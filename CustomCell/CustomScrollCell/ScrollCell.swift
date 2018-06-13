//
//  ScrollCell.swift
//  CustomCell
//
//  Created by cpu12130-local on 5/30/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class ScrollCell: UITableViewCell, ConfigurableCell {
   
    
    typealias DataType = String
    //MARK: Properties
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.showsHorizontalScrollIndicator = false
            scrollView.isPagingEnabled = true
            scrollView.bounces = false
        }
    }
    lazy var btnRemove: UIButton! = {
        let button = UIButton()
        button.setTitle("Remove", for: .normal)
        button.backgroundColor = .red
        button.titleLabel?.textColor = .white
        button.frame = CGRect(x: frame.width - frame.height, y: 0, width: frame.height, height: frame.height)
        button.addTarget(self, action: #selector(actionRemove(_:)), for: .touchDown)
        return button
    }()
    lazy var btnFlag: UIButton = {
       let button = UIButton()
        button.setTitle("Flag", for: .normal)
        button.backgroundColor = .blue
        button.titleLabel?.textColor = .white
        button.frame = CGRect(x: frame.width - (frame.height*2), y: 0, width: frame.height, height: frame.height)
        button.addTarget(self, action: #selector(actionFlag(_:)), for: .touchDown)
        return button
    }()
    
    lazy var view: UIView! = {
        let viewContent = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        viewContent.addSubview(title)
        viewContent.backgroundColor = .green
        return viewContent
    }()
    var oldOffset = CGFloat(0)
    var avatar: UIImage!
    lazy var title: UILabel! = {
        let titleContent = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width - 20, height: frame.height - 20))
        return titleContent
    }()
    //Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureView()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    override func layoutSubviews() {
    }
    func configureView(){
        scrollView.delegate = self
        title.center = view.center
        let width = view.frame.width + btnRemove.frame.width + btnFlag.frame.width
        scrollView.contentSize = CGSize(width: width, height: 0)
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        singleTap.cancelsTouchesInView = false
        singleTap.numberOfTapsRequired = 1
        view.addGestureRecognizer(singleTap)
        scrollView.addSubview(btnRemove)
        scrollView.addSubview(btnFlag)
        scrollView.addSubview(view)
    }
    
    @objc func handleTap(_ recognizer: UITapGestureRecognizer) {
        print("Touch")
    }
    //Actions
    @objc func actionRemove(_ sender: UIButton) {
        print("Remove")
    }
    @objc func actionFlag(_ sender: UIButton) {
        print("Flag")
    }
    func configure(data: String) {
        title.text = data
    }
    
    func pushView(data: String) -> UIViewController? {
        return nil
    }
    
}
extension ScrollCell: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let delta = scrollView.contentOffset.x - oldOffset
        btnFlag.frame = CGRect(x: btnFlag.frame.minX + delta, y: 0, width: frame.height, height: frame.height)
        btnRemove.frame = CGRect(x: btnRemove.frame.minX + delta, y: 0, width: frame.height, height: frame.height)
        oldOffset = scrollView.contentOffset.x
    }
    
}
