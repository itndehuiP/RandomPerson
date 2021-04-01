//
//  MapAnnotation.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import Foundation
import MapKit

class MapAnnotation: NSObject, MKAnnotation {
  let descriptionName: String?
  let coordinate: CLLocationCoordinate2D

    init(description: String?, coordinate: CLLocationCoordinate2D) {
        self.descriptionName = description
        self.coordinate = coordinate
        super.init()
    }

    var subtitle: String? {
        descriptionName
    }
}
