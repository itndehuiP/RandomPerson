//
//  Name.swift
//  RandomHuman
//
//  Created by Guerson Perez on 29/03/21.
//

import Foundation

struct Name: Codable {
    let title: String?
    let first: String?
    let last: String?
    
    var fullname: String? {
        guard title != nil || first != nil || last != nil else {
            return nil
        }
        let titleDescription = title != nil ? "\(title!)." : ""
        return "\(titleDescription) \(first ?? "") \(last ?? "")"
    }
}
