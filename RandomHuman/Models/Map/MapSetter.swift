//
//  MapSetter.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import Foundation
import CoreLocation

struct MapSetter {
    let coordinates: CLLocationCoordinate2D
    let description: String?
    
    init?(coordinate: CLLocationCoordinate2D?, description: String?) {
        guard let coordinate = coordinate else {
            return nil
        }
        self.coordinates = coordinate
        self.description = description
    }
}
