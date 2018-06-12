//
//  AudioPlayer.swift
//  CustomCell
//
//  Created by Thang Tran on 6/9/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import Foundation

class AudioPlayer {
    enum State {
        case idle
        case playing(Item)
        case paused(Item)
    }
    
    struct Item {
    }
    
    private var observations = [ObjectIdentifier: Observation]()
}

extension AudioPlayer {
    struct Observation {
        weak var observer: AudioPlayerObserver?
    }
    
    func addObserver(_ observer: AudioPlayerObserver) {
        let id = ObjectIdentifier(observer)
        observations[id] = Observation(observer: observer)
    }
    
    func removeObserver(_ observer: AudioPlayerObserver) {
        let id = ObjectIdentifier(observer)
        observations.removeValue(forKey: id)
    }
}


private extension AudioPlayer {
    func stateDidChange(_ state: State) {
        for (id, observation) in observations {
            // If the observer is no longer in memory, we
            // can clean up the observation for its ID
            
            guard let observer = observation.observer else {
                observations.removeValue(forKey: id)
                continue
            }
            
            switch state {
            case .idle:
                observer.audioPlayerDidStop(self)
            case .playing(let item):
                observer.audioPlayer(self, didStartPlaying: item)
            case .paused(let item):
                observer.audioPlayer(self, didPausePlaybackOf: item)
            }
        }
    }
}
