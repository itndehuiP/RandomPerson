//
//  Location.swift
//  RandomHuman
//
//  Created by Guerson Perez on 29/03/21.
//

import Foundation

/// Geolocalizable place
struct Location: Codable {
    let street: Street?
    let city: String?
    let state: String?
    let country: String?
    let postcode: String?
    let coordinates: Coordinate?
    let timeZone: TimeZone?
}
