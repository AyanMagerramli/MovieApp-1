//
//  MoviesCell.swift
//  MovieApp
//
//  Created by Ziyadkhan on 04.12.23.
//

import UIKit

class MoviesCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        movieImage.layer.cornerRadius = 20
    }

}

