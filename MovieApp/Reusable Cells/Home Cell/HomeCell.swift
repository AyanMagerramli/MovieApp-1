//
//  HomeCell.swift
//  MovieApp
//
//  Created by Ziyadkhan on 07.12.23.
//

import UIKit

protocol HomeCellDelegate {
    func didSelectMovie(at index: Int)
}

class HomeCell: UICollectionViewCell {

    @IBOutlet weak var movieCategoryLabel: UILabel!
    @IBOutlet weak var moviesCollection: UICollectionView!
    
    var movies = [MovieResult]()
    var delegate: HomeCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        moviesCollection.register(UINib(nibName: "TopImageBottomLabelCell", bundle: nil), forCellWithReuseIdentifier: "TopImageBottomLabelCell")
    }
    
    func configure(title: String, movies: [MovieResult]) {
        movieCategoryLabel.text = title
        self.movies = movies
        moviesCollection.reloadData()
    }
}

extension HomeCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopImageBottomLabelCell", for: indexPath) as! TopImageBottomLabelCell
        cell.configure(data: movies[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectMovie(at: movies[indexPath.item].id ?? 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 167, height: collectionView.frame.height)
    }
}

