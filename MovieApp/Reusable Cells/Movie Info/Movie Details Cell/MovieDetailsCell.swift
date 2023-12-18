//
//  MovieDetailsCell.swift
//  MovieApp
//
//  Created by Ziyadkhan on 14.12.23.
//

import UIKit

class MovieDetailsCell: UICollectionViewCell {

    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieLength: UILabel!
    @IBOutlet weak var movieLanguage: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    
    @IBOutlet weak var genreCollection: UICollectionView!
    let viewModel = MovieInfoViewModel()
    var genres: [Genre]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        genreCollection.register(UINib(nibName: "GenresCell", bundle: nil), forCellWithReuseIdentifier: "GenresCell")
    }
}

extension MovieDetailsCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        genres?.count ?? 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenresCell", for: indexPath) as! GenresCell
        cell.genreLabel.text = genres?[indexPath.item].name ?? "bosh"
        return cell
    }
}
