//
//  TopImageBottomLabelCell.swift
//  MovieApp
//
//  Created by Ziyadkhan on 07.12.23.
//

import UIKit

class TopImageBottomLabelCell: UICollectionViewCell {

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieImage.layer.cornerRadius = 16
    }
    func configure(data: Result) {
        movieTitleLabel.text = data.title
        movieImage.showImage(imageURL: data.posterPath)
    }
}
