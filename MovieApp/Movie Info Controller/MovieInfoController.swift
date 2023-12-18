//
//  MovieInfoController.swift
//  MovieApp
//
//  Created by Ziyadkhan on 14.12.23.
//

import UIKit

class MovieInfoController: UIViewController {
    
    @IBOutlet weak var movieInfoCollection: UICollectionView!
    
    let viewModel = MovieInfoViewModel()
    var selectedID: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureXibs()
        configureViewModel()
    }
    
    func configureViewModel() {
        viewModel.error = { errorMessage in
            print(errorMessage)
        }
        viewModel.success = {
            self.movieInfoCollection.reloadData()        }
        viewModel.getMovieInfoItems(movieID: selectedID)
    }
}

extension MovieInfoController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movieItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = viewModel.movieItems[indexPath.item]
        
        switch item.type {
        case .poster(let path):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieTrailerCell", for: indexPath) as! MovieTrailerCell
            if let path {
                cell.movieImage.showImage(imageURL: path)
            }
            return cell
            
        case .title(let title):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieNameCell", for: indexPath) as! MovieNameCell
            cell.movieTitleLabel.text = title
            return cell
            
        case .info(let info):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieDetailsCell", for: indexPath) as! MovieDetailsCell
            cell.movieLength.text = "\(info.length  ?? "0")min"
            cell.movieRating.text = "N/A"
            cell.movieLanguage.text = "English"
            cell.movieRatingLabel.text = "⭐ \(info.rating ?? "0") / 10 "
            cell.genres = info.genres
            return cell
            
        case .description(let description):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieDescriptionCell", for: indexPath) as! MovieDescriptionCell
            cell.movieDescriptionLabel.text = description
            return cell
            
        case .cast:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCastCell", for: indexPath) as! MovieCastCell
            return cell
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = viewModel.movieItems[indexPath.item]
        switch item.type {
        case .poster:
            return CGSize(width: collectionView.frame.width - 32, height: 240)
        case .title:
            return CGSize(width: collectionView.frame.width - 32, height: 50)
        case .info:
            return CGSize(width: collectionView.frame.width - 32, height: 130)
        case .description:
            return CGSize(width: collectionView.frame.width - 32, height: 144)
        case .cast:
            return CGSize(width: collectionView.frame.width - 32, height: 150)
        }
    }
}

// MARK: Functions
extension MovieInfoController {
    func configureXibs() {
        movieInfoCollection.register(UINib(nibName: "MovieTrailerCell", bundle: nil), forCellWithReuseIdentifier: "MovieTrailerCell")
        movieInfoCollection.register(UINib(nibName: "MovieNameCell", bundle: nil), forCellWithReuseIdentifier: "MovieNameCell")
        movieInfoCollection.register(UINib(nibName: "MovieDetailsCell", bundle: nil), forCellWithReuseIdentifier: "MovieDetailsCell")
        movieInfoCollection.register(UINib(nibName: "MovieDescriptionCell", bundle: nil), forCellWithReuseIdentifier: "MovieDescriptionCell")
        movieInfoCollection.register(UINib(nibName: "MovieCastCell", bundle: nil), forCellWithReuseIdentifier: "MovieCastCell")
    }
}
