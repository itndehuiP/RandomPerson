//
//  Coordinate.swift
//  RandomHuman
//
//  Created by Guerson Perez on 30/03/21.
//

import Foundation
import CoreLocation

struct Coordinate: Codable {
    let latitude: String?
    let longitude: String?
    
    var clCoordinates: CLLocationCoordinate2D? {
        guard let latituteString = latitude,
              let longitudeString = longitude,
              let latitute = Double(latituteString),
              let longitude = Double(longitudeString) else {
            return nil
        }
        return CLLocationCoordinate2D(latitude: latitute, longitude: longitude)
    }
}

