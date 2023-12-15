//
//  MovieInfoManager.swift
//  MovieApp
//
//  Created by Ziyadkhan on 14.12.23.
//

import Foundation

class MovieInfoManager {
    
    func getMovieInfo(endpoint: Endpoints, movieID: Int?, completion: @escaping ((MovieInfoModel?, String?) -> Void)) {
        NetworkManager.request(model: MovieInfoModel.self,
                               endpoint: "\(endpoint.rawValue)\(movieID ?? 0)") { data, errorMessage in
            if let errorMessage {
                completion(nil, errorMessage.localizedDescription)
            } else if let data {
                completion(data, nil)
            }
        }
    }
}
