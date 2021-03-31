//
//  Extension+Color.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import Foundation
import UIKit

extension UIColor {
    static let alert = UIColor(named: "Alert")
    static let constrast = UIColor(named: "Contrast")
    static let highlight = UIColor(named: "Highlight")
    static let secondHighlight = UIColor(named: "SecondHighlight")
    static let theme = UIColor(named: "Theme")
    
    static func randomHappyColor(quantity: Int) -> UIColor? {
        let quantity = max(quantity, 2)
        let quantityM = min(quantity, 4)
        let random = Int.random(in: 0...quantityM)
        switch random {
        case 0:
            return UIColor.alert
        case 2:
            return UIColor.highlight
        case 3:
            return UIColor.alert
        default:
            return UIColor.secondHighlight
        }
    }
    
}
