//
//  ProfileViewController.swift
//  CustomCell
//
//  Created by Thang Tran on 6/22/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // Should Change to VIP
    private let logicController: ProfileInteractor
    
    init(logicController: ProfileInteractor) {
        self.logicController = logicController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        render(.loading)
        
        logicController.load { [weak self] state in
            self?.render(state)
        }
    }

}

extension ProfileViewController {
    private func render(_ state: ProfileState ) {
        switch state {
        case .loading:
            print("Show loading indicator")
        case .presenting(_):
            print("Binding to view")
        case .failed(_):
            print("Show error view")
        }
    }
}
