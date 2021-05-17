//
//  TrackManager.swift
//  MusicApp
//
//  Created by 김영서 on 2021/05/18.
//

import UIKit
import AVFoundation

class TrackManager{
    
    //필요 프로퍼티
    var tracks : [AVPlayerItem] = []
    var albums : [Album] = []
    var todayRecoomand  : AVPlayerItem?
    
    init() {
        let tracks = loadTracks()
        self.tracks = tracks
        self.albums = loadAlbums(tracks: tracks)
    }
    
    func loadTracks() -> [AVPlayerItem]{
        //파일을 읽어서 AVPlayerItem 만들기
        //1
        
        let urls = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: nil) ?? []
        
//        var items : [AVPlayerItem] = []
//        for url in urls {
//            let item = AVPlayerItem(url: url)
//            items.append(item)
//        }
//
        let items = urls.map { url  in
            return AVPlayerItem(url: url)
        }
//        let item = AVPlayerItem(url: URL)
        return items
    }
    
    func track(at index : Int) -> Track? {
        let playerItem = tracks[index]
        // playerItem > Track
        let track = playerItem.convertToTrack()
        return track
    }
    // 가져온 트랙을 가지고 앨범이름으로 뭉쳐모여서 앨범을 리턴해준다
    func loadAlbums(tracks : [AVPlayerItem]) -> [Album] {
        let trackList : [Track] = tracks.compactMap{$0.convertToTrack()}
        let albumDics = Dictionary(grouping: trackList, by : {(track) in track.albumName})
        var albums: [Album] = []
        for(key, value) in albumDics{
            let title = key
            let tracks = value
            let album = Album(title: title, tracks: tracks)
            albums.append(album)
        }
        
        return albums
    }
    
    
    func loadOtherTodaysTrack(){
        self.todayRecoomand = self.tracks.randomElement()
    }

}
