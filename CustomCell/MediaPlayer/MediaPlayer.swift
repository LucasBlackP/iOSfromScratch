//
//  MediaPlayer.swift
//  CustomCell
//
//  Created by Thang Tran on 6/22/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import Foundation

class MediaPlayer {
    enum State {
        case idle
        case playing(Item)
        case paused(Item)
    }
    
    struct Item {
        
    }
    
    private var state = State.idle {
        didSet {
            stateDidChange()
        }
    }
    
    private var observations = (
        started: [(MediaPlayer, Item) -> Void](),
        paused: [(MediaPlayer, Item) -> Void](),
        stopped: [(MediaPlayer) -> Void]()
    )
}

extension MediaPlayer {
    private func stateDidChange() {
        switch state {
        case .idle:
            observations.stopped.forEach { closure in
                closure(self)
            }
        case .playing(let item):
            observations.started.forEach { closure in
                closure(self, item)
            }
        case .paused(let item):
            observations.paused.forEach { closure in
                closure(self, item)
            }
        }
    }
}

extension MediaPlayer {
    func observePlaybackStarted(using closure: @escaping (MediaPlayer, Item) -> Void) {
        observations.started.append(closure)
    }
    
    func observePlaybackPaused(using closure: @escaping (MediaPlayer, Item) -> Void) {
        observations.paused.append(closure)
    }
    
    func observePlaybackStopped(using closure: @escaping (MediaPlayer) -> Void) {
        observations.stopped.append(closure)
    }
}
