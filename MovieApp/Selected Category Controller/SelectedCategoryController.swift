//
//  SelectedCategoryController.swift
//  MovieApp
//
//  Created by Ziyadkhan on 18.12.23.
//

import UIKit

class SelectedCategoryController: UIViewController {
 
    @IBOutlet weak var collection: UICollectionView!
    
    let viewModel = SelectedCategoryViewModel()
    var selectedCategory: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        configXib()
//        print(selectedCategory)
    }
    
    func configureViewModel() {
        viewModel.error = { error in
            print(error ?? "bosh")
        }
        viewModel.success = {
            self.collection.reloadData()
        }
        viewModel.getItems(selectedCategory: selectedCategory ?? "")
    }
}

extension SelectedCategoryController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movieItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopImageBottomLabelCell", for: indexPath) as! TopImageBottomLabelCell
        cell.movieImage.showImage(imageURL: viewModel.movieItems[indexPath.item].backdropPath)
        cell.movieTitleLabel.text = viewModel.movieItems[indexPath.item].title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "MovieInfoController") as! MovieInfoController
        controller.selectedID = viewModel.movieItems[indexPath.item].id
        navigationController?.show(controller, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width/2-10, height: 280)
    }
}

extension SelectedCategoryController {
    func configXib() {
        collection.register(UINib(nibName: "TopImageBottomLabelCell", bundle: nil), forCellWithReuseIdentifier: "TopImageBottomLabelCell")
    }
}
