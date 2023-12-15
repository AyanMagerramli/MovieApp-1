//
//  MovieInfoViewModel.swift
//  MovieApp
//
//  Created by Ziyadkhan on 14.12.23.
//

import Foundation

enum MovieDetailItemType {
    case poster
    case title
    case info
    case description
    case cast
}

struct MovieDetailModel {
    let type: MovieDetailItemType
    let data: Any?
}

struct MovieInfo {
    let rating: String?
    let genres: [Genre]
    let length: String?
    let language: [SpokenLanguage]
}

class MovieInfoViewModel {
    
    var movieItems = [MovieDetailModel]()
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    private let manager = MovieInfoManager()
    func getMovieInfoItems(movieID: Int?) {
        manager.getMovieInfo(endpoint: .movieInfo, movieID: movieID) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.movieItems.append(.init(type: .poster, data: data.posterPath))
                self.movieItems.append(.init(type: .title, data: data.title))
                self.movieItems.append(.init(type: .info, data: MovieInfo(rating: "\(data.voteAverage ?? 0) / 10 IMDB",
                                                                          genres: data.genres ?? [],
                                                                          length: "\(data.runtime ?? 0)",
                                                                          language: data.spokenLanguages!)))
                self.movieItems.append(.init(type: .description, data: data.overview))
                self.movieItems.append(.init(type: .cast, data: data.adult))
                self.success?()
            }
        }
    }
}

