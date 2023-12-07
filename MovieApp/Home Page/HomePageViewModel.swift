//
//  HomePageViewModel.swift
//  MovieApp
//
//  Created by Ziyadkhan on 03.12.23.
//

import Foundation
import UIKit

class HomePageViewModel {
    
    var movieItems = [MovieCategoryModel]()
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getItems() {
        getMovieItems(title: "Now Playing", endpoint: .nowPlaying) {
            self.getMovieItems(title: "Popular", endpoint: .popular) {
                self.getMovieItems(title: "Top Rated", endpoint: .topRated) {
                    self.getMovieItems(title: "Upcoming", endpoint: .upcoming) {
                        self.success?()
                    }
                }
            }
        }
    }
    
    func getMovieItems(title: String, endpoint: Endpoints, completion: @escaping (() -> Void)) {
        NetworkManager.request(model: MovieModel.self, endpoint: endpoint.rawValue) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage.localizedDescription)
            } else if let data {
                self.movieItems.append(.init(title:title, movies: data.results ?? []))
                completion()
//                self.success?()
            }
        }
    }
}
