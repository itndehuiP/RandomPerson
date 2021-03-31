//
//  NavigationBarItem.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import Foundation
import UIKit

struct NavigationBarItem {
    let option: NavigationBarItemOption
    let selector: Selector
    let title: String?
    let systemIMgName: String?
    let style: ButtonStyle
}
