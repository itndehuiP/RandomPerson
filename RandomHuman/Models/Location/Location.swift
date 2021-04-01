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
    let postcode: Int?
    let postcodeS: String?
    let coordinates: Coordinate?
    let timezone: TimeZone?
        
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        street = try values.decode(Street.self, forKey: .street)
        city = try values.decode(String.self, forKey: .city)
        state = try values.decode(String.self, forKey: .state)
        country = try values.decode(String.self, forKey: .country)
        coordinates = try values.decode(Coordinate.self, forKey: .coordinates)
        timezone = try values.decode(TimeZone.self, forKey: .timezone)
        if let postcode = try? values.decode(Int.self, forKey: .postcode) {
            self.postcode = postcode
            self.postcodeS = "\(postcode)"
        } else if let postcodeS = try? values.decode(String.self, forKey: .postcode) {
            self.postcodeS = postcodeS
            self.postcode = Int(postcodeS)
        } else {
            self.postcode = nil
            self.postcodeS = nil
        }
    }
    
    var address: String? {
        var builder: String = ""
        if let streetDescription = street?.streetDescription {
            builder = streetDescription
        }
        appendToBuilder(&builder, addition: city?.capitalized)
        appendToBuilder(&builder, addition: state?.capitalized)
        appendToBuilder(&builder, addition: country?.capitalized)
        appendToBuilder(&builder, addition: postcodeS)
        return builder.isEmpty ? nil : builder
    }
    
    //MARK: Text Builder
    private func textValid(_ text: String?) -> Bool {
        !(text ?? "").isEmpty
    }
    
    private func appendToBuilder(_ builder: inout String, addition: String?) {
        if textValid(addition) {
            if !builder.isEmpty {
                builder.append(", ")
                builder.append(addition!)
            }
        }
    }
    
}
