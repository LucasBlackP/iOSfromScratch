//
//  AudioPlayerObserver.swift
//  CustomCell
//
//  Created by Thang Tran on 6/9/18.
//  Copyright © 2018 cpu12130-local. All rights reserved.
//

import Foundation


protocol AudioPlayerObserver: class {
    func audioPlayer(_ player: AudioPlayer, didStartPlaying: AudioPlayer.Item)
    func audioPlayer(_ player: AudioPlayer, didPausePlayBackOf: AudioPlayer.Item)
    func audioPlayerDidStop(_ player: AudioPlayer)
}

extension AudioPlayerObserver {
    func audioPlayer(_ player: AudioPlayer,
                     didStartPlaying item: AudioPlayer.Item) {}
    
    func audioPlayer(_ player: AudioPlayer,
                     didPausePlaybackOf item: AudioPlayer.Item) {}
    
    func audioPlayerDidStop(_ player: AudioPlayer) {}
}


