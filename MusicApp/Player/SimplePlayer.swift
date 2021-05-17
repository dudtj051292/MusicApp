//
//  SimplePlayer.swift
//  MusicApp
//
//  Created by 김영서 on 2021/05/18.
//

import UIKit
import AVFoundation

class SimplePlayer {
    
    private let playuer = AVPlayer()
    
    var currentTime : Double {
        return 0.0
    }
    var totalDuration : Double {
        return 0.0
    }
    var isPlaying : Bool {
        return false
    }
    
    var currentItem : AVPlayerItem?{
        return nil
    }
    
    init() {
        
    }
    
    func pause(){
        
    }
    func play(){
        
    }
    
    
}
