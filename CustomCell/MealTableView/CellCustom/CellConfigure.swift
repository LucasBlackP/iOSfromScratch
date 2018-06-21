//
//  CellConfigure.swift
//  CustomCell
//
//  Created by cpu12130-local on 4/11/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

protocol ConfigurableCell {
    associatedtype DataType
    var indexPath: IndexPath?{get set}
    var delegate: ScrollableCellDelegate?{get set}
    func setDelegate(delegate: ScrollableCellDelegate?, indexPath: IndexPath)
    func configure(data: DataType)
    func pushView(data: DataType)->UIViewController?
}

protocol CellConfigurator {
    static var reuseId: String { get }
    func configure(cell: UIView, cellDelegate: ScrollableCellDelegate?, indexPath: IndexPath)
    func pushView()->UIViewController?
}

class TableCellConfigurator<CellType: ConfigurableCell, DataType>: CellConfigurator where CellType.DataType == DataType, CellType: UITableViewCell {
    static var reuseId: String { return String(describing: CellType.self) }
    
    let item: DataType
    
    init(item: DataType) {
        self.item = item
    }
    func configure(cell: UIView, cellDelegate: ScrollableCellDelegate?, indexPath: IndexPath) {
        (cell as! CellType).setDelegate(delegate: cellDelegate, indexPath: indexPath)
        (cell as! CellType).configure(data: item)
    }
    func pushView() -> UIViewController? {
        let b = CellType()
        return b.pushView(data: item)
    }

}
protocol ScrollableCellDelegate: class{
    func cellWasSelected(indexPath: IndexPath)
    func cellWasDeleted(indexPath: IndexPath)
    func cellWasFlagged(indexPath: IndexPath)
}
