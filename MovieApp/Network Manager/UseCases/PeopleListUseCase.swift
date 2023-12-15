//
//  PeopleListUseCase.swift
//  MovieApp
//
//  Created by Ziyadkhan on 14.12.23.
//

import Foundation

protocol PeopleListUseCase {
    func getPeopleList(endpoint: PeopleEndpoint, completion: @escaping ((People?, String?) -> Void))
}
