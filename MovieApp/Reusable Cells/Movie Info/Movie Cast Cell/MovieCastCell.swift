//
//  MovieCastCell.swift
//  MovieApp
//
//  Created by Ziyadkhan on 14.12.23.
//

import UIKit

class MovieCastCell: UICollectionViewCell {
    
    @IBOutlet weak var actorsCastCollection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        actorsCastCollection.register(UINib(nibName: "ActorsCell", bundle: nil), forCellWithReuseIdentifier: "ActorsCell")
    }
    
    @IBAction func seemoreActionButton(_ sender: Any) {
    }
    
}

extension MovieCastCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActorsCell", for: indexPath) as! ActorsCell
        cell.actorImage.image = UIImage(named: "jasons")
        cell.actorNameLabel.text = "Jason Statham"
        return cell
    }
}
