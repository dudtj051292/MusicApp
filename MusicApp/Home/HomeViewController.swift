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
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TrackCollectionHeaderView", for: indexPath)as?
                    TrackCollectionHeaderView else{
                return UICollectionReusableView()
            }
            
            header.update(with: item)
            print("1")
            header.tapHandler = {item in
                //Player를 띄운다
                let playerStoryboard = UIStoryboard.init(name: "Player", bundle: nil)
                guard let playerVC = playerStoryboard.instantiateViewController(identifier: "PlayerViewController") as?
                        PlayerViewController else {return}
                playerVC.simplePlayer.replaceCurrentItem(with: item)
                self.present(playerVC, animated: true, completion: nil)
                print("2")

                
//                print("--> item \(item.convertToTrack()?.title)")
            }
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
}


extension HomeViewController : UICollectionViewDelegate{
    // 클릭했을때 어떻게 할까?
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let playerStoryboard = UIStoryboard.init(name: "Player", bundle: nil)
        guard let playerVC = playerStoryboard.instantiateViewController(identifier: "PlayerViewController") as? PlayerViewController else { return }
        let item = trackManager.tracks[indexPath.item]
        playerVC.simplePlayer.replaceCurrentItem(with: item)
        present(playerVC, animated: true, completion: nil)
    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let playerStoryboard = UIStoryboard.init(name: "Player", bundle: nil)
//        guard let playerVC = playerStoryboard.instantiateViewController(identifier: "PlayerViewController") as?
//                PlayerViewController else {return}
//        let item = trackManager.tracks[indexPath.item]
//        playerVC.simplepPlayer.replaceCurrentItem(with: item)
//        present(playerVC, animated: true, completion: nil)
//    }
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
