//
//  SimplePlayer.swift
//  MusicApp
//
//  Created by 김영서 on 2021/05/18.
//

import UIKit
import AVFoundation

class SimplePlayer {
    
    static let shared = SimplePlayer()
    
    private let player = AVPlayer()
    
    var currentTime : Double {
        return player.currentItem?.currentTime().seconds ?? 0.0
//        return 0.0
    }
    var totalDuration : Double {
        return player.currentItem?.duration.seconds ?? 0.0
//        return 0.0
    }
    var isPlaying : Bool {
        return player.isPlaying
//        return false
    }
    
    var currentItem : AVPlayerItem?{
        return player.currentItem
//        return nil
    }
    
    init() {
        
    }
    
    func pause(){
        player.pause()
    }
    func play(){
        player.play()
    }
    func seek(to time : CMTime){
        player.seek(to: time)
    }
    func replaceCurrentItem(with item : AVPlayerItem?){
        player.replaceCurrentItem(with: item)
    }
    func addPerioidicTimeObserver(forInterval : CMTime, queue : DispatchQueue? , using : @escaping (CMTime) -> Void ) {
        player.addPeriodicTimeObserver(forInterval : forInterval, queue: queue, using :using)
    }
    
    
}
