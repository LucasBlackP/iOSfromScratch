//
//  CustomTableCell.swift
//  CustomCell
//
//  Created by cpu12130-local on 4/11/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit



class MealCell: UITableViewCell{
    weak var delegate: ScrollableCellDelegate?
    var indexPath: IndexPath?
    lazy var mealPhoto: UIImageView = {
        let photo = UIImageView(frame: CGRect(x: 20, y: 5, width: 80, height: 80))
        photo.layer.masksToBounds = true
        photo.layer.cornerRadius = photo.frame.height/2
        photo.clipsToBounds = true
        return photo
        
    }()
    lazy var mealName: UILabel = {
        let label = UILabel(frame: CGRect(x: mealPhoto.frame.width + 35, y: center.y, width: frame.width - 100, height: 45))
        label.center = CGPoint(x: mealPhoto.frame.width + 35 + label.frame.width/2, y: center.y)
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .black
        return label
    }()
    lazy var cellView: UIView = {
       let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: frame.height)
        view.addSubview(mealPhoto)
        view.addSubview(mealName)
        view.backgroundColor = .white
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        singleTap.cancelsTouchesInView = false
        singleTap.numberOfTapsRequired = 1
        view.addGestureRecognizer(singleTap)
        return view
    }()
    lazy var btnRemove: UIButton! = {
        let button = UIButton()
        button.setTitle("Remove", for: .normal)
        button.backgroundColor = .red
        button.titleLabel?.textColor = .white
        button.frame = CGRect(x: UIScreen.main.bounds.width - frame.height, y: 0, width: frame.height, height: frame.height)
        button.addTarget(self, action: #selector(actionRemove(_:)), for: .touchDown)
        button.isHidden = true
        return button
    }()
    lazy var btnFlag: UIButton = {
        let button = UIButton()
        button.setTitle("Flag", for: .normal)
        button.backgroundColor = UIColor(red: 0, green: 150/255, blue: 250/255, alpha: 1)
        button.titleLabel?.textColor = .white
        button.frame = CGRect(x: UIScreen.main.bounds.width - (frame.height*2), y: 0, width: frame.height, height: frame.height)
        button.addTarget(self, action: #selector(actionFlag(_:)), for: .touchDown)
        button.isHidden = true
        return button
    }()
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width + btnRemove.frame.width + btnFlag.frame.width, height: 0)
            scrollView.addSubview(btnFlag)
            scrollView.addSubview(btnRemove)
            scrollView.addSubview(cellView)
            scrollView.delegate = self
            scrollView.isPagingEnabled = true
            scrollView.showsHorizontalScrollIndicator = false
            scrollView.showsHorizontalScrollIndicator = false
            scrollView.bounces = false
        }
    }
     var oldOffset = CGFloat(0)
    //MARK: -Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    //MARK: - Logic
    @objc func handleTap(_ recognizer: UITapGestureRecognizer) {
        if scrollView.contentOffset.x == 0{
            setSelected(true, animated: true)
            delegate?.cellWasSelected(indexPath: indexPath!)
            setSelected(false, animated: true)
        }
        else{
            UIView.animate(withDuration: 0.5){
                 self.scrollView.contentOffset.x = 0
            }
        }
    }
    @objc func actionRemove(_ sender: UIButton) {
        delegate?.cellWasDeleted(indexPath: indexPath!)
    }
    @objc func actionFlag(_ sender: UIButton) {
        delegate?.cellWasFlagged(indexPath: indexPath!)
    }
    
}
extension MealCell: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let delta = scrollView.contentOffset.x - oldOffset
        if(scrollView.contentOffset.x == 0){
            btnRemove.isHidden = true
            btnFlag.isHidden = true
        }
        else{
            btnRemove.isHidden = false
            btnFlag.isHidden = false
        }
        btnFlag.frame = CGRect(x: btnFlag.frame.minX + delta, y: 0, width: frame.height, height: frame.height)
        btnRemove.frame = CGRect(x: btnRemove.frame.minX + delta, y: 0, width: frame.height, height: frame.height)
        oldOffset = scrollView.contentOffset.x
    }
}
extension MealCell: ConfigurableCell{
    typealias DataType = Meal
    func configure(data: Meal) {
        scrollView.contentOffset.x = 0
        self.mealName.text = data.name
        self.mealPhoto.image = data.photo
    }
    func pushView(data: Meal) -> UIViewController? {
        let vc = DetailTableViewController()
        vc.meal = data
        return vc
    }
    func setDelegate(delegate: ScrollableCellDelegate?, indexPath: IndexPath) {
        self.delegate = delegate
        self.indexPath = indexPath
    }
    
}
