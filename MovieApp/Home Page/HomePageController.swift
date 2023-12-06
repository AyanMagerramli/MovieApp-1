//
//  HomePageController.swift
//  MovieApp
//
//  Created by Ziyadkhan on 03.12.23.
//

import UIKit

class HomePageController: UIViewController {
    
    @IBOutlet weak var movieCategoryCollection: UICollectionView!
    
    let viewModel = HomePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getMovieTopratedItems()
        viewModel.success = {
            self.movieCategoryCollection.reloadData()
            //            print(self.viewModel.movieItems ?? "bosh")
        }
    }
    
}

extension HomePageController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        
        cell.movieCategoryTitle.text = "Top Rated"
        cell.configCell()
        cell.moviesCollection.reloadData()
        
        return cell
    }
}
