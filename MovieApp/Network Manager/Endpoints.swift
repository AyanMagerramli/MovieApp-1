//
//  Endpoints.swift
//  MovieApp
//
//  Created by Ziyadkhan on 03.12.23.
//

import Foundation

enum Endpoints: String {
    case nowPlaying = "movie/now_playing"
    case popular = "movie/popular"
    case topRated = "movie/top_rated"
    case upcoming = "movie/upcoming"
    case popularPerson = "person/popular"
    case search = "search/movie"
    case movieInfo = "movie/3"
}