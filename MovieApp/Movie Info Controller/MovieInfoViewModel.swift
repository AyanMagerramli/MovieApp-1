//
//  MovieInfoViewModel.swift
//  MovieApp
//
//  Created by Ziyadkhan on 14.12.23.
//

import Foundation

enum MovieDetailItemType {
    case poster(String?)
    case title(String?)
    case info(MovieInfo)
    case description(String?)
    case cast(PeopleResult)
}

struct MovieDetailModel {
    let type: MovieDetailItemType
//    let data: Any?
}

struct MovieInfo {
    let rating: String?
    let genres: [Genre]
    let length: String?
    let releaseDate: String?
    let language: String?
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
                self.movieItems.append(.init(type: .poster(data.posterPath)))
                self.movieItems.append(.init(type: .title(data.title)))
                self.movieItems.append(.init(type: .info(.init(rating: "\((data.voteAverage?.rounded() ?? 0))", 
                                                               genres: data.genres ?? [], length: "\(data.runtime ?? 0)",
                                                               releaseDate: data.releaseDate, 
                                                               language: data.originalLanguage?.uppercased()))))
                self.movieItems.append(.init(type: .description(data.overview)))
                self.success?()
            }
        }
    }

}

