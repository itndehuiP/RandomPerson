//
//  Navigable.swift
//  PokeDemo
//
//  Created by Guerson on 2020-09-01.
//  Copyright © 2020 Itandehui. All rights reserved.
//

import Foundation
import UIKit
import os.log

protocol Navigable {
    func push(option: NavigateOption)
    func setRoot(vc: NavigateOption)
}

//TODO: Add generics functionality
extension Navigable where Self: UINavigationController {
    func push(option: NavigateOption) {
        guard let vc = option.getViewController() else {
            Logger().debug("Navigable: Couldn't find vc")
            return
        }
        switch option {
        case .people(let setter):
            guard let peopleView = vc as? PeopleView else {
                Logger().debug("Navigable: Couldn't cast vc as PeopleView")
                return
            }
            peopleView.set(setter)
            self.pushViewController(peopleView, animated: true)
        case .person(let personReceived):
            guard let personView = vc as? PersonView else {
                Logger().debug("Navigable: Couldn't cast vc as PersonView")
                return
            }
            personView.set(personReceived)
            self.pushViewController(personView, animated: true)
        case .mapview(let setter) :
            guard let mapView = vc as? MapView else {
                Logger().debug("Navigable: Couldn't cast vc as MapView")
                return
            }
            mapView.set(setter)
            self.pushViewController(mapView, animated: true)
        default:
            self.pushViewController(vc, animated: true)
        }
    }
    
    func setRoot(vc: NavigateOption) {
        if let vc = vc.getViewController() {
            self.viewControllers = [vc]
        }
    }
}
