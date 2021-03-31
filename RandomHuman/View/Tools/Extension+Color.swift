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
    
    static var randomHappyColor: UIColor? {
        let random = Int.random(in: 0...2)
        switch random {
        case 0:
            return UIColor.alert
        default:
            return UIColor.highlight
        }
    }
}
