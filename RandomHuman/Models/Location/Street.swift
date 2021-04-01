//
//  Street.swift
//  RandomHuman
//
//  Created by Guerson Perez on 30/03/21.
//

import Foundation

struct Street: Codable {
    let number: Int?
    let name: String?
    
    var streetDescription: String? {
        if name != nil || number != nil {
            let numberDescription = number != nil ? "\(number!)" : "--"
            return "\(name ?? "") \(numberDescription)"
        } else {
            return nil
        }
    }
}
