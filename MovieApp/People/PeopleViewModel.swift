//
//  PeopleViewModel.swift
//  MovieApp
//
//  Created by Ziyadkhan on 08.12.23.
//

import Foundation

class PeopleViewModel {
    var peopleItems = [PeopleResult]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getPeopleItems() {
        NetworkManager.request(model: People.self, endpoint: Endpoints.popularPerson.rawValue) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage.localizedDescription)
            } else if let data {
                self.peopleItems = data.results ?? []
                self.success?()
            }
        }
    }
}
