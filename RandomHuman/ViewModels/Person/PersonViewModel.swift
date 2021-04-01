//
//  PersonViewModel.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import Foundation

class PersonViewModel: ObservableObject {
    @Published var person: Person
    
    init(person: Person) {
        self.person = person
    }
    
    var nameCharacteristic: CharacteristicModel {
        CharacteristicModel(systemImgName: "person.fill", valueDescripton: person.fullnameDescription)
    }
    
    var ageDescription: CharacteristicModel {
        CharacteristicModel(systemImgName: "bolt.heart.fill", valueDescripton: person.ageDescription)
    }
    
    var nationalityDescription: CharacteristicModel {
        CharacteristicModel(systemImgName: "flag.fill", valueDescripton: person.nationalityDescription)
    }
    
    var genderDescription: CharacteristicModel {
        CharacteristicModel(systemImgName: "shippingbox.fill", valueDescripton: person.gender?.fullDescription)
    }
    
    var contactDescription: CharacteristicModel {
        CharacteristicModel(systemImgName: "person.crop.square.fill.and.at.rectangle", valueDescripton: person.contactDescription)
    }
    
    var addressDescription: CharacteristicModel {
        CharacteristicModel(systemImgName: "location.fill", valueDescripton: person.addressFullDescription)
    }
    
    var plainAddressDescription: String? {
        person.location?.address
    }
    
    var mediaURL: URL? {
        person.bigMediaURL
    }
    
    var validCoordinates: Bool {
        person.location?.coordinates?.clCoordinates != nil
    }
    
}
