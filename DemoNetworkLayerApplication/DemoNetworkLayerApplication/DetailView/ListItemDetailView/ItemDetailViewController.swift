//
//  ItemDetailViewController.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 5/3/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController, ItemDetailViewProtocol {
    
    //MARK: Properties
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemId: UILabel!
    
    var presenter: ItemDetailPresenterProtocol?
    var item: ListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configVP()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func showDetailView(for item: ListViewModel) {
        self.item = item
        let url = NSURL(string: item.thumbUrl)!
        let dataImage = NSData(contentsOf: url as URL)
        self.itemImage.image = UIImage(data: dataImage! as Data)
        self.itemId.text = String(item.id)
        self.itemTitle.text = item.title
    }
}
extension ItemDetailViewController{
    func configVP(){
        presenter?.displayDetail()
    }
}


