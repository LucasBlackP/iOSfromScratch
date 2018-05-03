//
//  ListItemWireframeProtocol.swift
//  DemoNetworkLayerApplication
//
//  Created by cpu12130-local on 5/3/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

protocol ListItemWireframeProtocol: class{
    static func createListItemModule()->UIViewController
    func createDetailScreen(from view: ListItemViewProtocol, with item: ListViewModel)
}
