//
//  SearchController.swift
//  MovieApp
//
//  Created by Ziyadkhan on 09.12.23.
//

import UIKit

class SearchController: UIViewController {
    
    @IBOutlet weak var movieCollection: UICollectionView!
    var searching = false
    
    let viewmodel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieCollection.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
    }
    
    @IBAction func searchTextField(_ sender: UITextField) {
        if let text = sender.text {
            viewmodel.getSearch(movieKey: text)
            movieCollection.reloadData()
        } else  {
            viewmodel.clearItems()
            movieCollection.reloadData()
        }
    }
}

extension SearchController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewmodel.searchedMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.movieTitleLabel.text = viewmodel.searchedMovies[indexPath.item].title
        cell.movieImage.showImage(imageURL: viewmodel.searchedMovies[indexPath.item].backdropPath)
        cell.movieRatingLabel.text = "⭐ \((viewmodel.searchedMovies[indexPath.item].voteAverage?.rounded() ?? 0)) / 10 IMDB"
        cell.movieDescriptionLabel.text = viewmodel.searchedMovies[indexPath.item].overview
        return cell
    }
}
