//
//  Extension+Array+IndexRange.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import Foundation

extension Array {
    func indexRange(_ index: Int?) -> Bool {
        guard let index = index,  index >= 0 && index < self.count else {
            return false
        }
        return true
    }
}
