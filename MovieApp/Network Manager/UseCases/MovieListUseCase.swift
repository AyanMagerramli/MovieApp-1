//
//  MovieListUseCase.swift
//  MovieApp
//
//  Created by Ziyadkhan on 14.12.23.
//

import Foundation

protocol MovieListUseCase {
    func getMovieList(endpoint: Endpoints, completion: @escaping ((MovieModel?, String?) -> Void))
}
