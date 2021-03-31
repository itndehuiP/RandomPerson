//
//  PersonHandler.swift
//  RandomHuman
//
//  Created by Guerson Perez on 30/03/21.
//

import Foundation
import NoAPI

typealias PersonResult = Result<Person?, RandomAPIError>
typealias PersonHandler = ((PersonResult) -> Void)?

//MARK: People
typealias People = [Person]
typealias PeopleResult = Result<People?, RandomAPIError>
typealias PeopleHandler = ((PeopleResult) -> Void)?
