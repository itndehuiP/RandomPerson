//
//  PeopleView.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import Foundation
import os.log

class PeopleViewModel: ObservableObject {
    
    @Published var people: People?
    @Published var errorDescription: String?
    
    func load(quantity: Int) {
        let interactor = APIInteractor()
        interactor.getNRandomPeople(quantity: quantity) { result in

            DispatchQueue.main.async { [weak self] in
                guard let self = self else {
                    Logger().error("PeopleViewModel: Nil self in load")
                    return
                }
                switch  result {
                case .success(let peopleReceived):
                    self.people = peopleReceived
                    self.errorDescription = nil
                case .failure(let error):
                    self.people = nil
                    Logger().error("PeopleViewModel: Found error in load \(error.localizedDescription)")
                    self.errorDescription = "Something went wrong"
                }
            }

        }
    }
    
    func getPerson(for index: Int) -> Person? {
        guard let people = people, index >= 0 && index < people.count else {
            return nil
        }
        return people[index]
    }

}
