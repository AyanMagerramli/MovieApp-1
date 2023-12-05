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
        viewModel.getMoviePopularItems()
//        viewModel.getAllMovieItems()
        viewModel.success = {
            self.movieCategoryCollection.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(viewModel.movieItems ?? "")
    }
}

extension HomePageController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        cell.movieCategoryTitle.text = "Popular"
        cell.configCell()
        cell.moviesCollection.reloadData()
        return cell
    }
}
