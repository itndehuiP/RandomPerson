//
//  NavigationBarItemOption.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import Foundation

enum NavigationBarItemOption {
    case back
    
    var isLeftButton: Bool {
        switch self {
        case .back:
            return true
        }
    }
    
}
