//
//  Person.swift
//  RandomHuman
//
//  Created by Guerson Perez on 29/03/21.
//

import Foundation

struct Person: Codable {
    let name: Name?
    let gender: Gender?
    let location: Location?
    let email: String?
    let username: Login?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case gender
        case location
        case email
        case username = "login"
    }
}


