//
//  PersonResponse.swift
//  RandomHuman
//
//  Created by Guerson Perez on 30/03/21.
//

import Foundation

struct PersonReponse: Codable {
    let results: [Person]?
    private let info: PersonResponseInfo?
    
    init (results: [Person]? = nil) {
        self.results = results
        self.info = nil
    }
    
    var first: Person? {
        results?.first
    }
}
