//
//  Extension+Array+String.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import Foundation

extension Array where Element == String {
    /**
     Tries to load a [String] from a propertyList
     - Parameter plistName: The name of the PropertyList to use.
     - returns: true if the loading was successfull, false if it was not.
     */
    mutating func load(plistName: String) -> Bool {
        if let plistURL = Bundle.main.url(forResource: plistName, withExtension: "plist"),
           let array = NSArray(contentsOf: plistURL) as? [String] {
            self = array
            return true
        }
        return false
    }
}
