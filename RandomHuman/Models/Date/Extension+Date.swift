//
//  Extension+Date.swift
//  RandomHuman
//
//  Created by Guerson Perez on 01/04/21.
//

import Foundation

extension Date {
    func checkIfSameDay(with cDate: Date) -> Bool {
        let calendar = Calendar.current
        return (calendar.dateInterval(of: .year, for: self) == calendar.dateInterval(of: .year, for: cDate) &&
                    calendar.dateInterval(of: .month, for: self) == calendar.dateInterval(of: .month, for: cDate) &&
                    calendar.dateInterval(of: .day, for: self) == calendar.dateInterval(of: .day, for: cDate))
    }
}
