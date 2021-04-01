//
//  UseRestrictor.swift
//  RandomHuman
//
//  Created by Guerson Perez on 01/04/21.
//

import Foundation

///Manages whether the user can have access to discover.
struct UseRestrictor {
    static let dailyUseKey = "dailyUse"
    
    static var canDiscover: Bool {
        guard let date = Defaults.dateForKey(UseRestrictor.dailyUseKey) else {
            return true
        }
        let currentDate = Date()
        let lastDiscoveryWasToday = currentDate.checkIfSameDay(with: date)
        return !lastDiscoveryWasToday
    }
    
    static func updateDiscoverDate() {
        Defaults.setDate(Date(), for: UseRestrictor.dailyUseKey)
    }
}
