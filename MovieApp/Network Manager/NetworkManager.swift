//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Ziyadkhan on 03.12.23.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let headers: HTTPHeaders = ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwOWMwM2ZjODc3ZmY2ZjQyOTg4ZDBjNjAyMzhmYTczMCIsInN1YiI6IjY1NmFlZmY0NjUxN2Q2MDBjYzQxMTc0NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.aztmmR3xws83nhTheWTgz69Jf-qtc5VR3GVPxTgDEu0"]
    
    static let baseURL = "https://api.themoviedb.org/3"
    
    static func request<T: Codable>(model: T.Type,
                                    endpoint: Endpoints,
                                    method: HTTPMethod = .get,
                                    parameters: Parameters? = nil,
                                    encoding: ParameterEncoding = URLEncoding.default,
                                    completion: @escaping ((T?, Error?) -> Void)
    ) {
        AF.request("\(baseURL)\(endpoint.rawValue)",
                   method: method,
                   parameters: parameters,
                   encoding: encoding,
                   headers: headers).responseDecodable(of: T.self) { response in
            switch (response.result) {
                
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
