//
//  MovieDetailsCell.swift
//  MovieApp
//
//  Created by Ziyadkhan on 14.12.23.
//

import UIKit

class MovieDetailsCell: UICollectionViewCell {

    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieLength: UILabel!
    @IBOutlet weak var movieLanguage: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var genreCollection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
