//
//  RadioPlayer.swift
//  CustomCell
//
//  Created by Thang Tran on 6/21/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import Foundation

protocol RadioPlayerObserver: class {
    func radioPlayer(_ player: RadioPlayer, didStartPlaying item: RadioPlayer.Item)
    func radioPlayer(_ player: RadioPlayer, didPausePlaybackOf item: RadioPlayer.Item)
    func radioPlayerDidStop(_ player: RadioPlayer)
}

extension RadioPlayerObserver {
    // to make function is optinal
    func radioPlayer(_ player: RadioPlayer, didStartPlaying item: RadioPlayer.Item) {}
    func radioPlayer(_ player: RadioPlayer, didPausePlaybackOf item: RadioPlayer.Item) {}
    func radioPlayerDidStop(_ player: RadioPlayer) {}
}

class RadioPlayer {
    
    enum State {
        case idle
        case playing(Item)
        case paused(Item)
    }
    
    struct Item {
        var title: String
    }
    
    private var observations = [ObjectIdentifier : Observation]()
    
    private var state = State.idle {
        didSet {
            stateDidChange()
        }
    }
    
}

extension RadioPlayer {
    private func stateDidChange() {
        for (id, observation) in observations {
            // If the observer is no longer in memory, we
            // can clean up the observation for its ID
            guard let observer = observation.observer else {
                observations.removeValue(forKey: id)
                continue
            }
            
            switch state {
            case .idle:
                observer.radioPlayerDidStop(self)
            case .playing(let item):
                observer.radioPlayer(self, didStartPlaying: item)
            case .paused(let item):
                observer.radioPlayer(self, didPausePlaybackOf: item)
            }
        }
    }
}

extension RadioPlayer {
    struct Observation {
        weak var observer: RadioPlayerObserver?
    }
    
    func addObserver(_ observer: RadioPlayerObserver) {
        let id = ObjectIdentifier(observer)
        observations[id] = Observation(observer: observer)
    }
    
    func removeObserver(_ observer: RadioPlayerObserver) {
        let id = ObjectIdentifier(observer)
        observations.removeValue(forKey: id)
    }
}
