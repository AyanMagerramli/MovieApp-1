//
//  PeopleInfoViewModel.swift
//  MovieApp
//
//  Created by Ziyadkhan on 18.12.23.
//

import Foundation

class PeopleInfoViewModel {
    var peopleInfoItems = [PeopleCast]()
    
    var sucess: (() -> Void)?
    var error: ((String) -> Void)?
    var peopleID: Int?
    
    
    init(peopleID: Int? = nil) {
        self.peopleID = peopleID
    }
    private let manager = PeopleInfoManager()
    
    func getPeopleInfoItems() {
        manager.getPeopleInfo(peopleID: peopleID) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.peopleInfoItems = data.cast ?? []
                self.sucess?()
            }
        }
    }
}
