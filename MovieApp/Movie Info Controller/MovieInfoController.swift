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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureXibs()
        configureViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    func configureViewModel() {
        viewModel.error = { errorMessage in
            print(errorMessage)
        }
        viewModel.success = {
            self.movieInfoCollection.reloadData()
            print(self.viewModel.movieItems)
        }
        viewModel.getMovieInfoItems(movieID: 324857)
    }
}

extension MovieInfoController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movieItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = viewModel.movieItems[indexPath.item]
        
        switch item.type {
            
        case .poster:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieTrailerCell", for: indexPath) as! MovieTrailerCell
            if let posterPath = item.data as? String {
                cell.movieImage.showImage(imageURL: posterPath)
                    }
            return cell
            
        case .title:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieNameCell", for: indexPath) as! MovieNameCell
            if let title = item.data as? String {
                cell.movieTitleLabel.text = title
            }
            return cell
            
        case .info:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieDetailsCell", for: indexPath) as! MovieDetailsCell
            return cell
            
        case .description:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieDescriptionCell", for: indexPath) as! MovieDescriptionCell
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
                   // Calculate height for poster cell based on your requirements
                   return CGSize(width: collectionView.frame.width - 32, height: 240) // Adjust as needed
               case .title:
                   // Calculate height for title cell based on your requirements
                   return CGSize(width: collectionView.frame.width - 32, height: 50) // Adjust as needed
               case .info:
                   // Calculate height for info cell based on your requirements
                   return CGSize(width: collectionView.frame.width - 32, height: 130) // Adjust as needed
               case .description:
                   // Calculate height for description cell based on your requirements
                   return CGSize(width: collectionView.frame.width - 32, height: 144) // Adjust as needed
               case .cast:
                   // Calculate height for cast cell based on your requirements
                   return CGSize(width: collectionView.frame.width - 32, height: 150) // Adjust as needed
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
