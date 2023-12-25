//
//  MovieCell.swift
//  MovieApp
//
//  Created by Ziyadkhan on 09.12.23.
//

import UIKit

class MovieCell: UICollectionViewCell {
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
