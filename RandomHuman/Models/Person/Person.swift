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
    let nationality: String?
    
    init(name: Name? = nil,
         gender: Gender? = nil,
         location: Location? = nil,
         email: String? = nil,
         username: Login? = nil,
         birthdate: Birthdate? = nil,
         cellphone: String?,
         media: MediaContent? = nil,
         nationality: String? = nil) {
        self.name = name
        self.gender = gender
        self.location = location
        self.email = email
        self.username = username
        self.birthdate = birthdate
        self.cellphone = cellphone
        self.media = media
        self.nationality = nationality
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
        case nationality = "nat"
    }
    
    var fullName: String? {
        name?.fullname
    }
    
    var fullnameDescription: String {
        "Name: \(fullName ?? "")"
    }
    
    var ageDescription: String {
        if let age = birthdate?.age {
            return "Age: \(age)"
        }
        return "Age: No available"
    }
    
    var nationalityDescription: String {
        if let nationality = nationality {
            return "Nationality: \(nationality)"
        } else {
            return "Nationality: No available"
        }
    }
    
    var contactDescription: String {
        "email: \(email ?? "No available")"
    }
    
    var addressFullDescription: String {
        "Address: \(location?.address ?? "No available")"
    }
    
    //MARK: Media URL
    var thumbnailURL: URL? {
        guard let mediaURL = media?.thumbnail else {
            return nil
        }
        return URL(string: mediaURL)
    }
    
    
    var mediumMediaURL: URL? {
        guard let mediaURL = media?.medium else {
            return nil
        }
        return URL(string: mediaURL)
    }
    
    var bigMediaURL: URL? {
        guard let mediaURL = media?.large else {
            return nil
        }
        return URL(string: mediaURL)
    }
}


