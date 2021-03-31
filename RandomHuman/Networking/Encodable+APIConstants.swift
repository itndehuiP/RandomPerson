//
//  Encodable+APIConstants.swift
//  RandomHuman
//
//  Created by Guerson Perez on 30/03/21.
//

import Foundation

extension Encodable {
    var apiScheme: String {
        APITools.scheme
    }
    
    var apiHost: String {
        APITools.host
    }
    
    var apiPath: String {
        APITools.apiPath
    }
}
