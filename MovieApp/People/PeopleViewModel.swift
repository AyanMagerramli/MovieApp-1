//
//  PeopleViewModel.swift
//  MovieApp
//
//  Created by Ziyadkhan on 08.12.23.
//

import Foundation

class PeopleViewModel {
    
    var peopleItems = [PeopleResult]()
    private let manager = PeopleManager()
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getPeopleItems(endpoint: Endpoints) {
        manager.getPeopleList(endpoint: .popularPerson) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.peopleItems = data.results ?? []
                self.success?()
            }
        }
    }
}
