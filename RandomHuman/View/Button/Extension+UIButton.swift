//
//  Extension+UIButton.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import Foundation
import UIKit

extension UIButton {
    @discardableResult
    func setTintColor(for style: ButtonStyle) -> UIColor? {
        switch style {
        case .highlighted:
            let color = UIColor.alert
            self.tintColor = UIColor.constrast
            self.backgroundColor = color
            return color
        case .normal:
            let color = UIColor.highlight
            self.tintColor = UIColor.constrast
            self.backgroundColor = color
            return color
        }
    }
}
