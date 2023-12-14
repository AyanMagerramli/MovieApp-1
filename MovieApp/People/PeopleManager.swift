//
//  PeopleManager.swift
//  MovieApp
//
//  Created by Ziyadkhan on 14.12.23.
//

import Foundation

class PeopleManager {
    func getPeopleList(endpoint: Endpoints, completion: @escaping ((People?, String?) -> Void)) {
        NetworkManager.request(model: People.self, endpoint: endpoint.rawValue) { data, errorMessage in
            if let errorMessage {
                completion(nil, errorMessage.localizedDescription)
            } else if let data {
                completion(data, nil)
            }
        }
    }
}
