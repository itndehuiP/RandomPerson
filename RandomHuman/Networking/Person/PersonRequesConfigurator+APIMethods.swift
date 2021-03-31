//
//  PersonRequesConfigurator+APIMethods.swift
//  RandomHuman
//
//  Created by Guerson Perez on 30/03/21.
//

import Foundation
import NoAPI

extension PersonRequestConfigurator {
    
    func api(method: HTTPMethod, heads: [String: String]?) -> Request<Self, PersonReponse> {
        self.request(scheme: apiScheme,
                     host: apiHost,
                     path: apiPath,
                     method: method,
                     res: PersonReponse.self,
                     req: self,
                     heads: heads,
                     encoder: nil,
                     decoder: nil)
    }
}
