//
//  HomeViewController.swift
//  MusicApp
//
//  Created by 김영서 on 2021/05/17.
//

import UIKit

class HomeViewController: UIViewController  {

    let trackManager : TrackManager = TrackManager()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}


extension HomeViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trackManager.tracks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrackCollectionViewCell", for: indexPath) as? TrackCollectionViewCell else{
            return UICollectionViewCell()

        }
        
        let track = trackManager.track(at: indexPath.item)
        cell.updateUI(item: track)
        return cell
    }
    
    //Header View
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let item = trackManager.todayRecoomand else {
                return UICollectionReusableView()
            }
            print("1")
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TrackCollectionHeaderView", for: indexPath)as?
                    TrackCollectionHeaderView else{
                return UICollectionReusableView()
            }
            print("2")
//
//            guard let header = collectionView.dequeueReusableCell(withReuseIdentifier: "TrackCollectionHeaderView", for: indexPath) as?
//                    TrackCollectionHeaderView else{
//                return UICollectionReusableView()
//            }
            header.update(with: item)
            header.tapHandler = {item -> Void in
                //Player를 띄운다
                print("--> item \(item.convertToTrack()?.title)")
            }
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
}


extension HomeViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension HomeViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing : CGFloat = 20
        let margin : CGFloat = 20
        let width =  (collectionView.bounds.width - itemSpacing - margin*2)/2
        let height = width+60
        return CGSize(width: width, height: height)
    }
}
