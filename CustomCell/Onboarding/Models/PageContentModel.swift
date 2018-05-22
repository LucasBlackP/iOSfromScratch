//
//  PageContentModel.swift
//  CustomCell
//
//  Created by cpu12130-local on 5/22/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

struct PageContentModel{
    var image: UIImage?
    var title: String?
    var description: String?
    init(image: UIImage, title: String, description: String){
        self.image = image
        self.title = title
        self.description = description
    }
}


