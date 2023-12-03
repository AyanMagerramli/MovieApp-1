//
//  HomePageViewModel.swift
//  MovieApp
//
//  Created by Ziyadkhan on 03.12.23.
//

import Foundation
import UIKit

class HomePageViewModel {
    
    var movieItems: MovieModel?
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getMovieItems() {
        NetworkManager.request(model: MovieModel.self, endpoint: .popular) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage.localizedDescription)
            } else if let data {
                self.movieItems = data
                self.success?()
            }
        }
    }
    
    func configureViewModel() {
        success = { [weak self] in
            print(self?.movieItems ?? "bosh")
        }
        error = { error in
            print(error)
        }
        getMovieItems()
    }
}
