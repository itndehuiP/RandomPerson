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
    let birthdate: Birthdate?
    let cellphone: String?
    let media: MediaContent?
    
    init(name: Name? = nil,
         gender: Gender? = nil,
         location: Location? = nil,
         email: String? = nil,
         username: Login? = nil,
         birthdate: Birthdate? = nil,
         cellphone: String?,
         media: MediaContent? = nil) {
        self.name = name
        self.gender = gender
        self.location = location
        self.email = email
        self.username = username
        self.birthdate = birthdate
        self.cellphone = cellphone
        self.media = media
    }
    
    private enum CodingKeys: String, CodingKey {
        case name
        case gender
        case location
        case email 
        case username = "login"
        case birthdate = "dob"
        case cellphone = "cell"
        case media = "picture"
    }
}


