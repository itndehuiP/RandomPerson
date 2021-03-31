//
//  APIInteractor.swift
//  RandomHuman
//
//  Created by Guerson Perez on 30/03/21.
//

import Foundation
import NoAPI
import os.log

struct APIInteractor {
    /**
     Fetches a random user from API
     - Parameter onCompletion: A handler containing the result of the request
     */
    func getRandomPerson(onCompletion: PersonHandler) {
        _ = PersonRequestConfigurator(results: "1").api(method: .get, heads: nil)
            .onSuccess({ response in
                onCompletion?(.success(response?.first))
            })
            .onError({ error in
                Logger().error("Error in getRandomPerson \(error.localizedDescription)")
                if let apiError = error as? APIError {
                    onCompletion?(.failure(.apiError(apiError)))
                } else {
                    onCompletion?(.failure(.other(error)))
                }
            })
    }
    /**
     Fetches three random users from API
     - Parameter onCompletion: A handler containing the result of the request
     */
    func getThreeRandomPerson(onCompletion: PeopleHandler) {
        _ = PersonRequestConfigurator(results: "3").api(method: .get, heads: nil)
            .onSuccess({ response in
                onCompletion?(.success(response?.results))
            })
            .onError({ error in
                Logger().error("Error in getThreeRandomPerson \(error.localizedDescription)")
                if let apiError = error as? APIError {
                    onCompletion?(.failure(.apiError(apiError)))
                } else {
                    onCompletion?(.failure(.other(error)))
                }
            })
    }
}
