
//
//  ProfileInteractor.swift
//  CustomCell
//
//  Created by Thang Tran on 6/22/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import UIKit

enum ProfileState {
    case loading
    case presenting(User)
    case failed(Error)
}

class ProfileInteractor {
    typealias Handler = (ProfileState) -> Void
    
    func load(then handler: @escaping Handler) {
        // Load the state of the view and then run a completion handler
    }
    
    func changeDisplayName(to name: String, then handler: @escaping Handler) {
        // Change the user's display name and then run a completion handler
    }
    
    func changeProfilePhoto(to photo: UIImage, then handler: @escaping Handler) {
        // Change the user's profile photo and then run a completion handler
    }
    
    func logout() {
        // Log the user out, then re-direct to the login screen
    }
}

