//
//  PeopleController.swift
//  MovieApp
//
//  Created by Ziyadkhan on 08.12.23.
//

import UIKit

class PeopleController: UIViewController {
    
    @IBOutlet weak var peopleCollection: UICollectionView!
    let viewModel = PeopleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        peopleCollection.register(UINib(nibName: "TopImageBottomLabelCell", bundle: nil),forCellWithReuseIdentifier: "TopImageBottomLabelCell")
        configureViewModel()
        title = "People"
    }
    
    func configureViewModel() {
        viewModel.error = { errorMessage in
            print(errorMessage)
        }
        viewModel.success = {
            self.peopleCollection.reloadData()
        }
        viewModel.getPeopleItems(endpoint: .popularPerson)
    }
    
}

extension PeopleController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.peopleItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopImageBottomLabelCell", for: indexPath) as! TopImageBottomLabelCell
        cell.configure(data: viewModel.peopleItems[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width/2 - 10, height: 180)
    }
}
