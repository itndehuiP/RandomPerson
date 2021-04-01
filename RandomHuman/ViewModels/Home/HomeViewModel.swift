//
//  HomeViewModel.swift
//  RandomHuman
//
//  Created by Guerson Perez on 01/04/21.
//

import Foundation

struct HomeViewModel {
    var canDiscover: Bool {
        UseRestrictor.canDiscover 
    }
    
    func updateDiscoverDate() {
        UseRestrictor.updateDiscoverDate()
    }
}
