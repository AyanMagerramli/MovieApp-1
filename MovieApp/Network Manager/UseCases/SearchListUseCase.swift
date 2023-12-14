//
//  SearchListUseCase.swift
//  MovieApp
//
//  Created by Ziyadkhan on 14.12.23.
//

import Foundation

protocol SearchListUseCase {
    func getSearchItems(endpoint: Endpoints, movieKey: String, completion: @escaping ((MovieModel?, String?) -> Void))
}
