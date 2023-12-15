//
//  MovieInfoManager.swift
//  MovieApp
//
//  Created by Ziyadkhan on 14.12.23.
//

import Foundation

class MovieInfoManager {
    
    func getMovieInfo(endpoint: Endpoints, completion: @escaping ((MovieInfoModel?, String?) -> Void)) {
        NetworkManager.request(model: MovieInfoModel.self,
                               endpoint: endpoint.rawValue) { data, errorMessage in
            if let errorMessage {
                completion(nil, errorMessage.localizedDescription)
            } else if let data {
                completion(data, nil)
            }
        }
    }
}
