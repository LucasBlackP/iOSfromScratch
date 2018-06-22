//
//  AudioPlayerWithNof.swift
//  CustomCell
//
//  Created by Thang Tran on 6/14/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import Foundation


class AudioPlayerWithNof {
    
    enum State {
        case idle
        case playing(Item)
        case paused(Item)
    }
    
    struct Item {
        var title: String
    }
    
    private let notificationCenter: NotificationCenter
    
    init(notificationCenter: NotificationCenter = .default) {
        self.notificationCenter = notificationCenter
    }

    
    private var state = State.idle {
        didSet {
            stateDidChange()
        }
    }
    
    private func stateDidChange() {
        switch state {
        case .idle:
            notificationCenter.post(name: .playbackStopped, object: nil)
        case .playing(let item):
            notificationCenter.post(name: .playbackStarted, object: item)
        case .paused(let item):
            notificationCenter.post(name: .playbackPaused, object: item)
        }
    }
    
    private func startPlayBack(with item: Item) {
        
    }
    
    private func pausePlayBack() {
        
    }
    
    private func stopPlayBack() {
        
    }
    
    func play(_ item: Item) {
        state = .playing(item)
        startPlayBack(with: item)
    }
    
    func pause() {
        switch state {
        case .idle, .paused:
            break
        case .playing(let item):
            state = .paused(item)
            pausePlayBack()
        }
    }
    
    func stop() {
        state = .idle
        stopPlayBack()
    }
    

}

extension Notification.Name {
    static var playbackStarted: Notification.Name {
        return .init(rawValue: "AudioPlayerWithNof.playbackStarted")
    }
    
    static var playbackPaused: Notification.Name {
        return .init(rawValue: "AudioPlayerWithNof.playbackPaused")
    }
    
    static var playbackStopped: Notification.Name {
        return .init(rawValue: "AudioPlayerWithNof.playbackStopped")
    }
}
