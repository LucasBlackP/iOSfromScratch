//
//  TableViewModel.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 4/20/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class CellForListViewModel{
    var data = [CellConfigurator]()
    var listItem: [ListViewModel]?
    init (list: [ListViewModel]){
        self.listItem = list
        for item in self.listItem! {
            data.append(TableCellConfigurator<ItemCell,ListViewModel>.init(item: item))
        }
    }
}
