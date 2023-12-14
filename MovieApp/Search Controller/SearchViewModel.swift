//
//  SearchViewModel.swift
//  MovieApp
//
//  Created by Ziyadkhan on 09.12.23.
//

import Foundation

class SearchViewModel {
    
    var searchedMovies = [MovieResult]()
    private let manager = SearchManager()
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getSearch(movieKey: String) {
        
        manager.getSearchItems(endpoint: .search, movieKey: movieKey) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.searchedMovies = data.results ?? []
                self.success?()
            }
        }
    }
    
    func clearItems() {
        searchedMovies.removeAll()
    }
}
