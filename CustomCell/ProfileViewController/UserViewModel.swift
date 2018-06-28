//
//  UserViewModel.swift
//  CustomCell
//
//  Created by Thang Tran on 6/25/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import Foundation


struct UserViewModel {
    let avatarURL: URL?
    let username: String?
    let friendsCount: Int
    let location: String?
    let website: String?
    
    let isHidden: Bool = false
    
    init(user: ProfileUser?) {
        self.avatarURL = user?.avatarURL
        self.username = user?.username
        self.friendsCount = (user?.friendsCount)!
        self.location = user?.location
        self.website = user?.website
    }
}

struct LoadingViewModel {
    let isHidden: Bool
}

struct ErrorViewModel {
    let message: String?
    let actionTitle: String?
    
    let isHidden: Bool = false
    
    init(error: Error?) {
        self.message = error.debugDescription
        self.actionTitle = ""
    }
    
  
}

struct ProfileViewModel {
    let userViewModel: UserViewModel
    let loadingViewModel: LoadingViewModel
    let errorViewModel: ErrorViewModel
    
    enum State {
        case initialized
        case loading
        case loaded(ProfileUser)
        case failed(Error)
    }
    // should consider var and add observer with this change state
    let state: State
    
    init(state: State) {
        self.state = state
        
        switch state {
        case .initialized:
            self.userViewModel = UserViewModel(user: nil)
            self.loadingViewModel = LoadingViewModel(isHidden: true)
            self.errorViewModel = ErrorViewModel(error: nil)
        case .loading:
            self.userViewModel = UserViewModel(user: nil)
            self.loadingViewModel = LoadingViewModel(isHidden: false)
            self.errorViewModel = ErrorViewModel(error: nil)
            
        case .loaded(let user):
            self.userViewModel = UserViewModel(user: user)
            self.loadingViewModel = LoadingViewModel(isHidden: false)
            self.errorViewModel = ErrorViewModel(error: nil)
            
        case .failed(let error):
            self.userViewModel = UserViewModel(user: nil)
            self.loadingViewModel = LoadingViewModel(isHidden: false)
            self.errorViewModel = ErrorViewModel(error: error)
        }
        
    }
    
//    private mutating func initViewModel(user: ProfileUser?, isHidden: Bool, error: Error? ) {
//        self.userViewModel = UserViewModel(user: user)
//        self.loadingViewModel = LoadingViewModel(isHidden: isHidden)
//        self.errorViewModel = ErrorViewModel(error: error)
//    }
    
    
}
