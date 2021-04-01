//
//  APIError.swift
//  RandomHuman
//
//  Created by Guerson Perez on 30/03/21.
//

import Foundation
import NoAPI

enum RandomAPIError: Error {
    case apiError(APIError)
    case other(Error)
}
