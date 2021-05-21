//
//  TrackCollectionViewCell.swift
//  MusicApp
//
//  Created by 김영서 on 2021/05/17.
//

import UIKit

class TrackCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var trackThumnail: UIImageView!
    @IBOutlet weak var trackTitle: UILabel!
    @IBOutlet weak var trackArtist: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        trackThumnail.layer.cornerRadius = 4
        trackArtist.textColor = UIColor.systemGray2
    }
    func updateUI(item : Track?){
        guard let track = item else{
            return
        }
        trackThumnail.image = track.artwork
        trackTitle.text = track.title
        trackArtist.text = track.artist
    }
}
