//
//  MovieInfoController.swift
//  MovieApp
//
//  Created by Ziyadkhan on 14.12.23.
//

import UIKit

class MovieInfoController: UIViewController {
    
    @IBOutlet weak var movieInfoCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension MovieInfoController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}
