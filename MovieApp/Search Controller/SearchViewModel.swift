//
//  SearchViewModel.swift
//  MovieApp
//
//  Created by Ziyadkhan on 09.12.23.
//

import Foundation

class SearchViewModel {
    var searchedMovies = [MovieResult]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    
    func getSearch(movieKey: String) {
        
        let param: [String: Any] = ["query": movieKey]
        
        NetworkManager.request(
            model: MovieModel.self,
            endpoint: Endpoints.search.rawValue,
            parameters: param
            
        ) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage.localizedDescription)
            } else if let data {
                self.searchedMovies = data.results ?? []
                self.success?()
            }
        }
    }
}
