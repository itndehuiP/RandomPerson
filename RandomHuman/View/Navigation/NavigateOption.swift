//
//  NavigateOption.swift
//  PokeDemo
//
//  Created by Guerson on 2020-09-01.
//  Copyright © 2020 Itandehui. All rights reserved.
//

import Foundation
import UIKit

enum NavigateOption {
    case home
    case people(PeopleSetter)
    case person(Person)
    case mapview(MapSetter)
}

extension NavigateOption: StoryboardIdentifiable {
    func getStoryboardName() -> String {
        switch self {
        case .home:
            return "HomeView"
        case .people:
            return "PeopleView"
        case .person:
            return "PersonView"
        case .mapview:
            return "MapView"
        }
    }
}


extension NavigateOption: ViewControllerIdentifiable {
    func getViewController() -> UIViewController? {
        let storyBoard = UIStoryboard(name: self.getStoryboardName(), bundle: nil)
        return storyBoard.instantiateInitialViewController()
    }
}
