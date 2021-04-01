//
//  NavigationBarSettable.swift
//  PokeDemo
//
//  Created by Guerson on 2020-09-01.
//  Copyright © 2020 Itandehui. All rights reserved.
//

import Foundation
import UIKit

protocol NavigationBarSettable: NSObjectProtocol {
    func setNavigationBar(with items: [NavigationBarItem]?)
}

extension NavigationBarSettable where Self: UINavigationController {
    func setNavigationBar(with items: [NavigationBarItem]?){
        guard let vc = self.viewControllers.last else { return }
        if let items = getItemsBySide(with: items) {
            self.navigationBar.isHidden = false
            var leftButtons: [UIBarButtonItem] = []
            for item in items.left ?? [] {
                leftButtons.append(getBarButton(with: item, vc: vc))
            }
        
            var rightButtons: [UIBarButtonItem] = []
            for item in items.right ?? [] {
                rightButtons.append(getBarButton(with: item, vc: vc))
            }
            
            vc.navigationItem.leftBarButtonItems = leftButtons
            vc.navigationItem.rightBarButtonItems = rightButtons
        } else {
            self.navigationBar.isHidden = true
        }
    }
    
    private func getBarButton(with item: NavigationBarItem, vc: UIViewController) -> UIBarButtonItem {
        let button = LabelButton(item: item)
        switch item.option {
        case .back:
            button.addTarget(vc, action: item.selector, for: .touchUpInside)
            return UIBarButtonItem(customView: button)
        }
    }

    private func getItemsBySide(with items: [NavigationBarItem]?) -> (left: [NavigationBarItem]?, right: [NavigationBarItem]?)? {
        guard let items = items else { return nil }
        var leftItems: [NavigationBarItem] = []
        var rightItems: [NavigationBarItem] = []
        
        for item in items {
            if item.option.isLeftButton {
                leftItems.append(item)
            } else {
                rightItems.append(item)
            }
        }
        return (!leftItems.isEmpty ? leftItems : nil, !rightItems.isEmpty ? rightItems : nil)
    }
    
}
