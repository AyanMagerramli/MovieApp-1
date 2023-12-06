//
//  CategoryCell.swift
//  MovieApp
//
//  Created by Ziyadkhan on 04.12.23.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var moviesCollection: UICollectionView!
    @IBOutlet weak var movieCategoryTitle: UILabel!
    
    let viewModel = HomePageViewModel()
    var count = 0
    
    func configCell() {
        moviesCollection.register(UINib(nibName: "MoviesCell", bundle: nil), forCellWithReuseIdentifier: "MoviesCell")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        viewModel.getMovieTopratedItems()
        viewModel.success = {
            self.moviesCollection.reloadData()
        }
    }
}

extension CategoryCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModel.movieItems?.results?.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCell", for: indexPath) as! MoviesCell
        
        cell.movieTitle.text = viewModel.movieItems?.results?[indexPath.item].title
        cell.movieImage.showImage(imageURL: viewModel.movieItems?.results?[indexPath.item].posterPath)
        
        return cell
    }
}
