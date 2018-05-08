//
//  CellConfigurationProtocol.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 4/20/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit


protocol ConfigurableCell {
    associatedtype DataType
    func configure(data: DataType)
    func pushView(data: DataType)->UIViewController?
    func setHeight()->Int
}

protocol CellConfigurator {
    static var reuseId: String { get }
    func configure(cell: UIView)
    func pushView()->UIViewController?
    func setHeight(cell: UIView)->Int
}

class TableCellConfigurator<CellType: ConfigurableCell, DataType>: CellConfigurator where CellType.DataType == DataType, CellType: UITableViewCell {
    static var reuseId: String { return String(describing: CellType.self) }
    let item: DataType
    init(item: DataType) {
        self.item = item
    }
    func configure(cell: UIView) {
        (cell as! CellType).configure(data: item)
    }
    func pushView() -> UIViewController? {
        let b = CellType()
        return b.pushView(data: item)
    }
    func setHeight(cell: UIView) -> Int {
        return (cell as! CellType).setHeight()
    }
}
