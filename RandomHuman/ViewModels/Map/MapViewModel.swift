//
//  MapViewModel.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import Foundation
import CoreLocation

class MapViewModel: ObservableObject {
    @Published var coordinate: CLLocationCoordinate2D
    var descriptionName: String?
    
    init(coordinate: CLLocationCoordinate2D, description: String?) {
        self.coordinate = coordinate
        self.descriptionName = description
    }
}
