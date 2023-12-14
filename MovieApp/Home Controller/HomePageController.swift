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
        configureViewModel()
        movieCategoryCollection.register(UINib(nibName: "HomeCell", bundle: nil),forCellWithReuseIdentifier: "HomeCell")
        title = "Home"
    }
    
    @IBAction func searchButton(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "SearchController") as! SearchController
        navigationController?.show(controller, sender: nil)
    }
    func configureViewModel() {
        viewModel.error = { errorMessage in
            print(errorMessage)
        }
        viewModel.success = {
            self.movieCategoryCollection.reloadData()
        }
        viewModel.getItems()
    }
    
}

extension HomePageController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, HomeCellDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movieItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.delegate = self
        let item = viewModel.movieItems[indexPath.item]
        cell.configure(title: item.title, movies: item.movies)
        return cell
    }
    
    func didSelectMovie(at index: Int) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "MovieInfoController") as! MovieInfoController
        navigationController?.show(controller, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 288)
    }
}
